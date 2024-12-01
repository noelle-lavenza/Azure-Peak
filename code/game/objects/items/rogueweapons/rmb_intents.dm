/datum/rmb_intent
	var/name = "intent"
	var/desc = ""
	var/icon_state = ""

/datum/rmb_intent/proc/special_attack(mob/living/user, atom/target)
	if(!isliving(target))
		return
	if(!user)
		return
	if(user.incapacitated())
		return
	var/mob/living/carbon/L = target
	user.changeNext_move(CLICK_CD_RAPID)
	playsound(user, 'sound/combat/feint.ogg', 100, TRUE)
	user.visible_message(span_danger("[user] feints an attack at [target]!"))
	SEND_SIGNAL(L, COMSIG_FEINT_REACT, user, target)
	if(HAS_TRAIT(L, TRAIT_FEINT_IMMUNITY))
		to_chat(user, span_warning("[L] seems completely unaffected by my maneuver!"))
		user.apply_status_effect(/datum/status_effect/debuff/feintcd)
		return
	var/perc = 50
	if(user.mind)
		var/obj/item/I = user.get_active_held_item()
		var/ourskill = 0
		var/theirskill = 0
		if(I)
			if(I.associated_skill)
				ourskill = user.mind.get_skill_level(I.associated_skill)
			if(L.mind)
				I = L.get_active_held_item()
				if(I?.associated_skill)
					theirskill = L.mind.get_skill_level(I.associated_skill)
		perc += (ourskill - theirskill)*20 	//skill is of the essence
		perc += (user.STAINT - L.STAINT)*15	//but it's also a mindgame
		perc += (user.STASPD - L.STASPD)*15 	//a swift feint can still fool a slow opponent

	if(L.d_intent == INTENT_DODGE)
		if(!L.mind && !user.has_status_effect(/datum/status_effect/debuff/feintcd))//Feinting an NPC will now perform a 'Trip' combat manuever. This feature is designed as a way to counter the AI's ability to dodge attacks that have a hit delay by constantly moving around..
			if(prob(80) || istype(user.rmb_intent, /datum/rmb_intent/feint))//Guaranteed if you're actually in a feinting stance.
				L.Knockdown(30)
				L.Immobilize(30)
				to_chat(user, span_notice("[L] is tripped up by my combat maneuver and momentarily stunned!"))
				user.apply_status_effect(/datum/status_effect/debuff/feintcd)
			else
				to_chat(user, span_warning("[L] avoids my trip maneuver... 80%"))
			return
		else
			perc = 0

	if(!L.cmode)
		perc = 0
	if(L.has_status_effect(/datum/status_effect/debuff/feinted))
		perc = 0
	if(user.has_status_effect(/datum/status_effect/debuff/feintcd))
		perc -= rand(10,30)
	user.apply_status_effect(/datum/status_effect/debuff/feintcd)
	perc = CLAMP(perc, 0, 90) //no zero risk superfeinting
	if(prob(perc)) //feint intent increases the immobilize duration significantly
		if(istype(user.rmb_intent, /datum/rmb_intent/feint))
			L.apply_status_effect(/datum/status_effect/debuff/feinted)
			L.changeNext_move(10)
			L.Immobilize(30)
			to_chat(user, span_notice("[L] fell for my feint attack!"))
			to_chat(L, span_danger("I fall for [user]'s feint attack!"))
		else
			L.apply_status_effect(/datum/status_effect/debuff/feinted)
			L.changeNext_move(5)
			L.Immobilize(10)
			to_chat(user, span_notice("[L] fell for my feint attack!"))
			to_chat(L, span_danger("I fall for [user]'s feint attack!"))
	else
		if(user.client?.prefs.showrolls)
			to_chat(user, span_warning("[L] did not fall for my feint... [perc]%"))

/datum/rmb_intent/aimed
	name = "aimed"
	desc = "Your attacks are more precise but have a longer recovery time. Higher critrate with precise attacks."
	icon_state = "rmbaimed"

/datum/rmb_intent/strong
	name = "strong"
	desc = "Your attacks have +1 strength but use more stamina. Higher critrate with brutal attacks."
	icon_state = "rmbstrong"

/datum/rmb_intent/swift
	name = "swift"
	desc = "Your attacks have less recovery time but are less accurate."
	icon_state = "rmbswift"

/datum/rmb_intent/special
	name = "special"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) A special attack that depends on the type of weapon you are using."
	icon_state = "rmbspecial"

/datum/rmb_intent/feint
	name = "feint"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) A deceptive half-attack with no follow-through, meant to force your opponent to open their guard. Useless against someone who is dodging."
	icon_state = "rmbfeint"

/datum/status_effect/debuff/feinted
	id = "nofeint"
	duration = 50

/datum/status_effect/debuff/feintcd
	id = "feintcd"
	duration = 100

/datum/status_effect/debuff/riposted
	id = "riposted"
	duration = 30

/datum/rmb_intent/riposte
	name = "defend"
	desc = "No delay between dodge and parry rolls."
	icon_state = "rmbdef"

/datum/rmb_intent/guard
	name = "guarde"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) Raise your weapon, ready to attack any creature who moves onto the space you are guarding."
	icon_state = "rmbguard"

/datum/rmb_intent/weak
	name = "weak"
	desc = "Your attacks have -1 strength and will never critically-hit. Surgery steps can only be done with this intent. Useful for longer punishments, play-fighting, and bloodletting."
	icon_state = "rmbweak"
