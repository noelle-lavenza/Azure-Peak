//By HELMSGUARD, by Stoned Elf https://github.com/Feralape
/obj/structure/barricade/wood_spike
	name = "wooden barrier"
	desc = "A defensive barrier made of sharp wooden stakes,"
	icon = 'modular_helmsguard/licensed-feralope/icons/obj/structure/spike_barricades.dmi'
	icon_state = "barricade"
	max_integrity = 250
	proj_pass_rate = 80
	blade_dulling = DULLING_BASHCHOP
	pass_flags = LETPASSTHROW
	bar_material = /obj/item/grown/log/tree/small
	climbable = TRUE
	can_buckle = FALSE
	attacked_sound = 'sound/misc/woodhit.ogg'
	destroy_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	debris = list(/obj/item/grown/log/tree/stake = 3)
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/barricade/wood_spike, /turf/closed/wall)
	resistance_flags = FLAMMABLE
	buckle_lying = 0
	var/contact_dir
	var/obj/item/bodypart/BP


/obj/structure/barricade/wood_spike/Bumped(atom/movable/AM)
	if(!ismob(AM))
		return
	var/mob/living/M = AM
	var/def_zone = BODY_ZONE_CHEST
	def_zone = pick(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	BP = M.get_bodypart(def_zone)
	can_buckle = TRUE
	if(BP)
		M.apply_damage(rand(5,20), BRUTE, BP, M.run_armor_check(BP, "stab", damage = rand(10,20)))
		var/armor = M.run_armor_check(BP, "stab")
		var/chance = rand(1,10)
		if(armor < 20)
			if(chance <= 3)
				BP.add_wound(/datum/wound/puncture)
				add_mob_blood(M)
				M.visible_message("<span class='danger'>[M]'s [BP.name] is pierced by the wooden spike!</span>")
				if(isliving(M))
					M.emote("pain")
			if(chance > 3)
				M.visible_message("<span class='danger'>[M] is impaled on the spikes by the [BP.name]!</span>")
				M.setDir(M.dir)
				contact_dir = get_dir(src, M)
				impale(M)
		else
			M.visible_message("<span class='danger'>[M]'s [BP.name] is bruised by the wooden spikes!</span>")
			M.Knockdown(rand(15,30))
			M.Immobilize(30)
			if(isliving(M))
				M.emote("scream")
		M.flash_fullscreen("redflash3")
		shake_camera(M, 3, 1)
	else
		M.simple_add_wound(/datum/wound/puncture, silent = FALSE, crit_message = FALSE)
		M.apply_damage(rand(10,50), BRUTE, BP, M.run_armor_check(BP, "stab", damage = rand(10,20)))
		M.visible_message("<span class='danger'>[M] is pierced by the wooden spike!</span>")

	playsound(src, pick("sound/combat/hits/bladed/genthrust (1).ogg", "sound/combat/hits/bladed/genthrust (2).ogg"),  100)



/obj/structure/barricade/wood_spike/proc/impale(mob/living/M)
	BP.add_wound(/datum/wound/puncture/large)
	M.forceMove(drop_location())
	buckle_mob(M, force=1)
	M.flash_fullscreen("redflash3")
	if(isliving(M))
		M.emote("painscream")

/obj/structure/barricade/wood_spike/climb_structure(mob/living/user)
	var/mob/living/M = user
	if(prob(70))
		M.apply_damage(rand(5,20), BRUTE, BP, M.run_armor_check(BP, "stab", damage = rand(10,20)))
		var/armor = M.run_armor_check(BP, "stab")
		if(armor < 20)
			M.visible_message("<span class='danger'>[M] is violently impaled on the [BP.name] when trying to climb over the [src]!</span>")
			M.setDir(M.dir)
			impale(M)
		else
			M.visible_message("<span class='danger'>[M] fails to climb over the [src] and was injured at their [BP.name]!</span>")
			M.Knockdown(rand(15,30))
			M.Immobilize(30)
			if(isliving(M))
				M.emote("scream")
	shake_camera(M, 3, 1)
	playsound(src, pick("sound/combat/hits/bladed/genthrust (1).ogg", "sound/combat/hits/bladed/genthrust (2).ogg"),  100)
	..()




/obj/structure/barricade/wood_spike/post_buckle_mob(mob/living/M)
	..()
	if(contact_dir == NORTH)
		M.set_mob_offsets("bed_buckle", _x = 0, _y = 8)
	if(contact_dir == SOUTH)
		M.set_mob_offsets("bed_buckle", _x = 0, _y = -8)
	if(contact_dir == EAST)
		M.set_mob_offsets("bed_buckle", _x = 8, _y = 0)
	if(contact_dir == WEST)
		M.set_mob_offsets("bed_buckle", _x = -8, _y = 0)



/obj/structure/barricade/wood_spike/user_unbuckle_mob(mob/living/M, mob/user)
	if(obj_broken)
		..()
		return
	if(isliving(user))
		var/mob/living/L = user
		var/success_chance = L.STASTR
		var/success_check = rand(15,30)
		success_chance += rand(1,20)
		user.changeNext_move(CLICK_CD_RAPID)
		playsound(src, "sound/foley/sew_flesh.ogg", 100)
		if(user != M)
			user.visible_message(span_warning("[user] tries to pull themselves [M] off of [src]!"))
		else
			if(isliving(M))
				M.emote("pain")
			user.visible_message(span_warning("[user] tries to struggle free from [src]!"))
		if(do_after(user, rand(30,60), src))
			if(success_chance >= success_check)
				playsound(src, pick("sound/foley/flesh_rem.ogg", "sound/foley/flesh_rem2.ogg"), 100)
				M.flash_fullscreen("redflash3")
				M.emote("painscream")
				user.visible_message(span_warning("[M] is pulled free from [src]!"))
				..()
			else
				if(user != M)
					user.visible_message(span_warning("[user] failed to remove [M] from [src]!"))
				else
					user.visible_message(span_warning("[user] failed to remove themselves from the [src]!"))
				if(isliving(M))
					M.emote("pain")
				M.flash_fullscreen("redflash3")
				return
			M.Knockdown(rand(15,30))
			M.Immobilize(30)

/obj/structure/barricade/wood_spike/post_unbuckle_mob(mob/living/M)
	..()
	var/turf/knockback = get_ranged_target_turf(M, turn(M.dir, 180), 1)
	M.throw_at(knockback, 1, 7)
	M.reset_offsets("bed_buckle")
	can_buckle = FALSE

/obj/structure/barricade/wood_spike/deconstruct(disassembled = TRUE)
	SEND_SIGNAL(src, COMSIG_OBJ_DECONSTRUCT, disassembled)
	if(islist(debris))
		for(var/I in debris)
			var/count = debris[I] + rand(-1,1)
			if(count > 0)
				for(var/i in 1 to count)
					new I (get_turf(src))
	if(islist(static_debris))
		for(var/I in static_debris)
			for(var/i in 1 to static_debris[I])
				new I (get_turf(src))
	qdel(src)

/obj/structure/barricade/wood_spike/obj_destruction(damage_flag)
	obj_destroyed = TRUE
	if(damage_flag == "acid")
		acid_melt()
	else if(damage_flag == "fire")
		burn()
	else
		if(destroy_sound)
			playsound(get_turf(src), destroy_sound, 100, TRUE)
		if(destroy_message)
			visible_message(destroy_message)
		deconstruct(FALSE)
	return TRUE
