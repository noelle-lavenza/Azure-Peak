/obj/item/needle
	name = "needle"
	icon_state = "needle"
	desc = "This sharp needle can sew wounds, cloth and can be used for self defence if you're crazy."
	icon = 'icons/roguetown/items/misc.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throwforce = 0
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH
	max_integrity = 20
	anvilrepair = /datum/skill/craft/blacksmithing
	tool_behaviour = TOOL_SUTURE
	experimental_inhand = FALSE
	/// Amount of uses left
	var/stringamt = 20
	var/maxstring = 20
	/// If this needle is infinite
	var/infinite = FALSE
	/// If this needle can be used to repair items
	var/can_repair = TRUE
	grid_width = 32
	grid_height = 32

/obj/item/needle/examine()
	. = ..()
	if(!infinite)
		if(stringamt > 0)
			. += span_bold("It has [stringamt] uses left.")
		else
			. += span_bold("It has no uses left.")
	else
		. += "Can be used indefinitely."

/obj/item/needle/Initialize()
	. = ..()
	update_icon()

/obj/item/needle/update_overlays()
	. = ..()
	if(stringamt <= 0)
		return
	. += "[icon_state]string"

/obj/item/needle/get_belt_overlay()
	return mutable_appearance('icons/roguetown/items/surgery_bag.dmi', "needle")

/obj/item/needle/use(used)
	if(infinite)
		return TRUE
	stringamt = stringamt - used
//	if(stringamt <= 0)
//		qdel(src)

/obj/item/needle/attack(mob/living/M, mob/user)
	sew(M, user)

/obj/item/needle/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/natural/fibers))
		if(infinite || maxstring - stringamt <= 0) //is the needle infinite OR does it have all of its uses left
			to_chat(user, span_warning("The needle has no need to be refilled."))
			return

		to_chat(user, "I begin threading the needle with additional fibers...")
		if(do_after(user, 6 SECONDS - user.mind.get_skill_level(/datum/skill/misc/sewing), target = I))
			var/refill_amount
			refill_amount = min(5, (maxstring - stringamt))
			stringamt += refill_amount
			to_chat(user, "I replenish the needle's thread by [refill_amount] uses!")
			qdel(I)
		return
	return ..()

/obj/item/needle/attack_obj(obj/O, mob/living/user)
	if(!isitem(O))
		return
	var/obj/item/I = O
	if(can_repair)
		if(stringamt < 1)
			to_chat(user, span_warning("The needle has no thread left!"))
			return
		if(I.sewrepair && I.max_integrity)
			if(I.obj_integrity == I.max_integrity)
				to_chat(user, span_warning("This is not broken."))
				return
			if(!I.ontable())
				to_chat(user, span_warning("I should put this on a table first."))
				return
			playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)

			// These are all constants used for tuning the balance of sewing.
			/// The chance to damage an item when entirely unskilled.
			var/const/BASE_FAIL_CHANCE = 60
			/// The (combined) skill level at or above which repairs can't fail.
			var/const/SKILL_NO_FAIL = SKILL_LEVEL_JOURNEYMAN
			/// Each level in tanning/sewing reduces the skill chance by this much, so that at SKILL_NO_FAIL you don't fail anymore.
			var/const/FAIL_REDUCTION_PER_LEVEL = BASE_FAIL_CHANCE / SKILL_NO_FAIL
			/// The damage done to an item when sewing fails while entirely unskilled.
			var/const/BASE_SEW_DAMAGE = 30
			/// Each level in either tanning or sewing reduces the damage caused by a failure by this many points
			var/const/DAMAGE_REDUCTION_PER_LEVEL = 5
			/// The base integrity repaired when sewing succeeds while entirely unskilled.
			var/const/BASE_SEW_REPAIR = 10
			/// The additional integrity repaired per combined level in sewing/tanning.
			var/const/SEW_REPAIR_PER_LEVEL = 10
			/// How many seconds does unskilled sewing take?
			var/const/BASE_SEW_TIME = 6 SECONDS
			/// At what (combined) level do we 
			var/const/SKILL_FASTEST_SEW = SKILL_LEVEL_LEGENDARY
			/// The reduction in sewing time for each (combined) level in sewing/tanning.
			var/const/SEW_TIME_REDUCTION_PER_LEVEL = 1 SECONDS
			/// The minimum sewing time to prevent instant sewing at max level.
			var/const/SEW_MIN_TIME = 0.5 SECONDS
			/// The maximum sewing time for squires.
			var/const/SQUIRE_MAX_TIME = BASE_SEW_TIME / 2 // always at least twice as fast as the base time
			/// The XP granted by failure. Scaled by INT.
			var/const/XP_ON_FAIL = 0.5
			/// The XP granted by success. Scaled by INT.
			var/const/XP_ON_SUCCESS = 0
			/// The minimum delay between automatic sewing attempts.
			var/const/AUTO_SEW_DELAY = CLICK_CD_MELEE

			// This is the actual code that applies those constants.
			// If you want to adjust the balance please try just tweaking the above constants first!
			var/skill = user.mind.get_skill_level(/datum/skill/misc/sewing) + user.mind.get_skill_level(/datum/skill/craft/tanning)
			// The more knowlegeable we are the less chance we damage the object
			var/failed = prob(BASE_FAIL_CHANCE - (skill * FAIL_REDUCTION_PER_LEVEL))
			var/sewtime = max(SEW_MIN_TIME, BASE_SEW_TIME - (SEW_TIME_REDUCTION_PER_LEVEL * skill))
			if(HAS_TRAIT(user, TRAIT_SQUIRE_REPAIR))
				failed = FALSE // just don't fail lol
				sewtime = min(sewtime, SQUIRE_MAX_TIME)
			if(!do_after(user, sewtime, target = I))
				return
			if(failed)
				// We do DAMAGE_REDUCTION_PER_LEVEL less damage per level.
				// You could write this as I.obj_integrity - BASE_SEW_DAMAGE + (skill * DAMAGE_REDUCTION_PER_LEVEL)
				// but that's less obvious and makes it look like it could repair it if your skill was high enough (false).
				I.obj_integrity = max(0, I.obj_integrity - (BASE_SEW_DAMAGE - (skill * DAMAGE_REDUCTION_PER_LEVEL)))
				user.visible_message(span_info("[user] damages [I] due to a lack of skill!"))
				playsound(src, 'sound/foley/cloth_rip.ogg', 50, TRUE)
				if(XP_ON_FAIL > 0)
					user.mind.add_sleep_experience(/datum/skill/misc/sewing, user.STAINT * XP_ON_FAIL)
				if(do_after(user, AUTO_SEW_DELAY, target = I))
					attack_obj(I, user)
				return
			else
				if(I.obj_broken && istype(I, /obj/item/clothing))
					var/obj/item/clothing/cloth = I
					cloth.obj_fix()
				playsound(loc, 'sound/foley/sewflesh.ogg', 50, TRUE, -2)
				user.visible_message(span_info("[user] repairs [I]!"))
				if(XP_ON_SUCCESS > 0)
					user.mind.add_sleep_experience(/datum/skill/misc/sewing, user.STAINT * XP_ON_SUCCESS)
				I.obj_integrity = min(I.obj_integrity + BASE_SEW_REPAIR + skill * SEW_REPAIR_PER_LEVEL, I.max_integrity)
				if(do_after(user, AUTO_SEW_DELAY, target = I))
					attack_obj(I, user)
		return
	return ..()

/obj/item/needle/proc/sew(mob/living/target, mob/living/user)
	if(!istype(user))
		return FALSE
	var/mob/living/doctor = user
	var/mob/living/carbon/human/patient = target
	if(stringamt < 1)
		to_chat(user, span_warning("The needle has no thread left!"))
		return
	var/list/sewable
	var/obj/item/bodypart/affecting
	if(iscarbon(patient))
		affecting = patient.get_bodypart(check_zone(doctor.zone_selected))
		if(!affecting)
			to_chat(doctor, span_warning("That limb is missing."))
			return FALSE
		sewable = affecting.get_sewable_wounds()
	else
		sewable = patient.get_sewable_wounds()
	if(!length(sewable))
		to_chat(doctor, span_warning("There aren't any wounds to be sewn."))
		return FALSE
	var/datum/wound/target_wound = sewable.len > 1 ? input(doctor, "Which wound?", "[src]") as null|anything in sewable : sewable[1]
	if(!target_wound)
		return FALSE

	var/moveup = 10
	if(doctor.mind)
		moveup = ((doctor.mind.get_skill_level(/datum/skill/misc/medicine)+1) * 5)
	while(!QDELETED(target_wound) && !QDELETED(src) && \
		!QDELETED(user) && (target_wound.sew_progress < target_wound.sew_threshold) && \
		stringamt >= 1)
		if(!do_after(doctor, 2 SECONDS, target = patient))
			break
		playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
		target_wound.sew_progress = min(target_wound.sew_progress + moveup, target_wound.sew_threshold)
		if(target_wound.sew_progress < target_wound.sew_threshold)
			continue
		if(doctor.mind)
			doctor.mind.add_sleep_experience(/datum/skill/misc/medicine, doctor.STAINT * 2.5)
		use(1)
		target_wound.sew_wound()
		if(patient == doctor)
			doctor.visible_message(span_notice("[doctor] sews \a [target_wound.name] on [doctor.p_them()]self."), span_notice("I stitch \a [target_wound.name] on my [affecting.name]."))
		else
			if(affecting)
				doctor.visible_message(span_notice("[doctor] sews \a [target_wound.name] on [patient]'s [affecting.name]."), span_notice("I stitch \a [target_wound.name] on [patient]'s [affecting.name]."))
			else
				doctor.visible_message(span_notice("[doctor] sews \a [target_wound.name] on [patient]."), span_notice("I stitch \a [target_wound.name] on [patient]."))
		log_combat(doctor, patient, "sew", "needle")
		return TRUE
	return FALSE

/obj/item/needle/thorn
	name = "needle"
	icon_state = "thornneedle"
	desc = "This rough needle can be used to sew cloth and wounds."
	stringamt = 5
	maxstring = 5
	anvilrepair = null

/obj/item/needle/pestra
	name = "needle of pestra"
	desc = span_green("This needle has been blessed by the goddess of medicine herself!")
	infinite = TRUE
