// Define the signals needed for the flagellant spells
#define COMSIG_MOB_APPLY_DAMAGE "mob_apply_damage"
// Define bleeding flag since it's not available in this codebase
#define BODYPART_BLEEDING (1<<1)

/obj/effect/proc_holder/spell/targeted/damage_transfer
	name = "Vicarious Suffering"
	desc = "Transfer any damage your target receives to yourself instead, taking their pain as your own for 2 minutes."
	clothes_req = FALSE
	human_req = TRUE
	charge_max = 1200  // 2 minutes cooldown
	cooldown_min = 600 // 1 minute minimum cooldown
	range = -1        // Infinite range
	invocation = "Your pain shall be mine!"
	invocation_type = "shout"
	action_icon_state = "damage_transfer"
	school = "holy"
	
/obj/effect/proc_holder/spell/targeted/damage_transfer/cast(list/targets, mob/user)
	if(!targets.len)
		to_chat(user, span_warning("No target found in range!"))
		return
		
	var/mob/living/carbon/target = targets[1]
	if(!istype(target))
		to_chat(user, span_warning("You can only cast this on people!"))
		return
	
	if(target.stat == DEAD)
		to_chat(user, span_warning("[target] is dead!"))
		return
	
	to_chat(user, span_notice("You prepare to take [target]'s suffering as your own..."))
	to_chat(target, span_warning("[user] begins a ritual to take your suffering!"))
	
	if(do_after(user, 30, target = target))
		to_chat(user, span_notice("You are now bound to [target]'s pain for 2 minutes."))
		to_chat(target, span_notice("[user] has bound themselves to your suffering."))
		
		RegisterSignal(target, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(on_target_damaged))
		RegisterSignal(target, list(COMSIG_LIVING_DEATH, COMSIG_LIVING_STATUS_UNCONSCIOUS), PROC_REF(on_target_incap))
		
		addtimer(CALLBACK(src, PROC_REF(end_damage_transfer), target), 2 MINUTES)

/obj/effect/proc_holder/spell/targeted/damage_transfer/proc/on_target_incap(datum/source)
	var/mob/living/carbon/target = source
	to_chat(usr, span_warning("Your connection to [target] has been broken by their condition!"))
	to_chat(target, span_notice("[usr]'s connection to your suffering has been broken!"))
	end_damage_transfer(target)

/obj/effect/proc_holder/spell/targeted/damage_transfer/proc/end_damage_transfer(mob/living/carbon/target)
	if(QDELETED(target))
		return
	
	UnregisterSignal(target, list(COMSIG_MOB_APPLY_DAMAGE, COMSIG_LIVING_DEATH, COMSIG_LIVING_STATUS_UNCONSCIOUS))
	to_chat(usr, span_warning("Your connection to [target]'s pain has faded."))
	to_chat(target, span_notice("[usr] is no longer bound to your suffering."))

/obj/effect/proc_holder/spell/targeted/damage_transfer/proc/on_target_damaged(datum/source, damage, damagetype, def_zone)
	if(!damage || !isliving(source))
		return
	
	var/mob/living/L = source
	var/mob/living/carbon/human/H = usr
	
	if(L && H && iscarbon(L))
		// Transfer the damage
		H.apply_damage(damage, damagetype, def_zone)
		L.adjustBruteLoss(-damage) // Negate the damage on the target
		
		// Transfer bleeding status if applicable
		if(iscarbon(L) && iscarbon(H))
			var/mob/living/carbon/C_target = L
			var/mob/living/carbon/C_user = H
			
			// Check if the target has bleeding wounds
			var/obj/item/bodypart/affected_limb = C_target.get_bodypart(def_zone)
			if(affected_limb && affected_limb.get_damage() > 0)
				// Find the corresponding bodypart on the flagellant
				var/obj/item/bodypart/user_limb = C_user.get_bodypart(def_zone)
				if(user_limb)
					// Check if the limb is bleeding
					var/target_bleeding = C_target.get_bleed_rate() > 0
					if(target_bleeding)
						// Make the target stop bleeding
						C_target.suppress_bloodloss(5 MINUTES)
						// Make the user start bleeding
						C_user.bleed(2)
						to_chat(H, span_warning("You take on [L]'s bleeding wounds!"))
						to_chat(L, span_notice("Your bleeding wounds transfer to [H]!"))
		
		to_chat(L, span_notice("Your wounds are taken by [H]!"))
		to_chat(H, span_warning("You feel [L]'s pain!"))
		new /obj/effect/temp_visual/heal(get_turf(L), "#FF0000")
		new /obj/effect/temp_visual/heal(get_turf(H), "#FF0000")

/obj/effect/proc_holder/spell/targeted/affliction_transfer
	name = "Burden of Martyrdom"
	desc = "Take on the afflictions of your target, healing their wounds and restoring missing limbs at great cost to yourself. If used on the dead, you can sacrifice your own life to restore theirs."
	clothes_req = FALSE
	human_req = TRUE
	charge_max = 3000  // 5 minutes cooldown
	cooldown_min = 1800 // 3 minutes minimum cooldown
	range = -1         // Infinite range
	invocation = "I shall bear your wounds as my own!"
	invocation_type = "shout"
	action_icon_state = "affliction_transfer"
	school = "holy"
	
/obj/effect/proc_holder/spell/targeted/affliction_transfer/cast(list/targets, mob/user)
	if(!targets.len)
		return
	
	var/mob/living/carbon/human/H_target = targets[1]
	var/mob/living/carbon/human/H_user = user
	
	if(!istype(H_user) || !istype(H_target))
		to_chat(user, span_warning("This spell only works on humans!"))
		return
	
	var/is_dead = (H_target.stat == DEAD)
	if(is_dead)
		to_chat(user, span_warning("[H_target] is dead. Your sacrifice could restore them, but it will cost your life!"))
		to_chat(H_target, span_warning("[user] begins a ritual of ultimate sacrifice to restore you!"))
	else
		to_chat(user, span_notice("You prepare to take [H_target]'s afflictions as your own..."))
		to_chat(H_target, span_warning("[user] begins a ritual to take your afflictions!"))
	
	if(do_after(user, is_dead ? 100 : 60, target = H_target))
		// Handle revival case
		if(is_dead)
			// Final warning
			if(alert(user, "Are you sure you want to sacrifice your life to restore [H_target]?", "Ultimate Sacrifice", "Yes", "No") != "Yes")
				to_chat(user, span_warning("You stop the ritual."))
				return
				
			// Dramatic effects
			new /obj/effect/temp_visual/heal(get_turf(H_user), "#FF0000")
			new /obj/effect/temp_visual/heal(get_turf(H_target), "#FFFFFF")
			
			// Revive target
			H_target.revive(full_heal = TRUE, admin_revive = FALSE)
			H_target.grab_ghost(force = TRUE)
			
			// Messages
			to_chat(H_target, span_notice("You feel life surge back into your body as [H_user] sacrifices themselves for you!"))
			to_chat(H_user, span_warning("Your life force drains away as you restore [H_target] to life!"))
			
			// Kill the user
			H_user.death()
			return
			
		// Normal healing case continues as before...
		var/brute_to_heal = H_target.getBruteLoss()
		var/burn_to_heal = H_target.getFireLoss()
		var/tox_to_heal = H_target.getToxLoss()
		var/oxy_to_heal = H_target.getOxyLoss()
		
		// Transfer bleeding status from all bodyparts
		if(iscarbon(H_target) && iscarbon(H_user))
			var/mob/living/carbon/C_target = H_target
			var/mob/living/carbon/C_user = H_user
			
			// Check if target is bleeding
			if(C_target.get_bleed_rate() > 0)
				// Stop target bleeding
				C_target.suppress_bloodloss(5 MINUTES)
				// Make user bleed
				C_user.bleed(5)
				to_chat(H_user, span_warning("You take on [H_target]'s bleeding wounds!"))
				to_chat(H_target, span_notice("Your bleeding wounds transfer to [H_user]!"))
		
		// Apply existing healing effects
		H_target.adjustBruteLoss(-brute_to_heal)
		H_target.adjustFireLoss(-burn_to_heal)
		H_target.adjustToxLoss(-tox_to_heal)
		H_target.adjustOxyLoss(-oxy_to_heal)
		
		H_user.adjustBruteLoss(brute_to_heal * 0.5)
		H_user.adjustFireLoss(burn_to_heal * 0.5)
		H_user.adjustToxLoss(tox_to_heal * 0.5)
		H_user.adjustOxyLoss(oxy_to_heal * 0.5)
		
		to_chat(H_target, span_notice("Your wounds are miraculously healed!"))
		to_chat(H_user, span_warning("You take on [H_target]'s wounds!"))
		
		// Heal target's bodyparts
		for(var/obj/item/bodypart/BP in H_target.bodyparts)
			if(BP.brute_dam > 0 || BP.burn_dam > 0)
				var/obj/item/bodypart/user_bp = H_user.get_bodypart(BP.body_zone)
				if(user_bp)
					user_bp.receive_damage(brute=30)
		
		// Restore missing limbs by sacrificing the flagellant's own
		var/list/missing_limbs = list()
		if(!H_target.get_bodypart(BODY_ZONE_L_ARM))
			missing_limbs += BODY_ZONE_L_ARM
		if(!H_target.get_bodypart(BODY_ZONE_R_ARM))
			missing_limbs += BODY_ZONE_R_ARM
		if(!H_target.get_bodypart(BODY_ZONE_L_LEG))
			missing_limbs += BODY_ZONE_L_LEG
		if(!H_target.get_bodypart(BODY_ZONE_R_LEG))
			missing_limbs += BODY_ZONE_R_LEG
		
		for(var/zone in missing_limbs)
			// Check if the flagellant has this limb to sacrifice
			var/obj/item/bodypart/user_limb = H_user.get_bodypart(zone)
			if(user_limb)
				// Create a new limb for the target
				var/obj/item/bodypart/new_limb
				switch(zone)
					if(BODY_ZONE_L_ARM)
						new_limb = new /obj/item/bodypart/l_arm()
					if(BODY_ZONE_R_ARM)
						new_limb = new /obj/item/bodypart/r_arm()
					if(BODY_ZONE_L_LEG)
						new_limb = new /obj/item/bodypart/l_leg()
					if(BODY_ZONE_R_LEG)
						new_limb = new /obj/item/bodypart/r_leg()
				
				if(new_limb)
					// Remove the flagellant's limb
					user_limb.drop_limb(TRUE)
					qdel(user_limb)
					
					// Give the target a new limb
					new_limb.replace_limb(H_target, TRUE)
					to_chat(H_target, span_notice("You feel a new [new_limb.name] growing!"))
					to_chat(H_user, span_warning("Your [new_limb.name] withers and falls off!"))
					
					// Visual effect
					new /obj/effect/temp_visual/heal(get_turf(H_target), "#FF0000")
			else
				to_chat(H_user, span_warning("You don't have a [zone] to sacrifice!"))
		
		// Restore missing organs by sacrificing the flagellant's own
		var/list/missing_organs = list()
		if(!H_target.getorganslot(ORGAN_SLOT_HEART))
			missing_organs += ORGAN_SLOT_HEART
		if(!H_target.getorganslot(ORGAN_SLOT_LIVER))
			missing_organs += ORGAN_SLOT_LIVER
		if(!H_target.getorganslot(ORGAN_SLOT_LUNGS))
			missing_organs += ORGAN_SLOT_LUNGS
		if(!H_target.getorganslot(ORGAN_SLOT_EYES))
			missing_organs += ORGAN_SLOT_EYES
		
		for(var/slot in missing_organs)
			// Check if the flagellant has this organ to sacrifice
			var/obj/item/organ/user_organ = H_user.getorganslot(slot)
			if(user_organ)
				// Create a new organ for the target
				var/obj/item/organ/new_organ
				switch(slot)
					if(ORGAN_SLOT_HEART)
						new_organ = new /obj/item/organ/heart()
					if(ORGAN_SLOT_LIVER)
						new_organ = new /obj/item/organ/liver()
					if(ORGAN_SLOT_LUNGS)
						new_organ = new /obj/item/organ/lungs()
					if(ORGAN_SLOT_EYES)
						new_organ = new /obj/item/organ/eyes()
				
				if(new_organ)
					// Remove the flagellant's organ
					user_organ.Remove(H_user)
					qdel(user_organ)
					
					// Give the target a new organ
					new_organ.Insert(H_target)
					to_chat(H_target, span_notice("You feel a new [new_organ.name] growing inside you!"))
					to_chat(H_user, span_warning("Your [new_organ.name] withers away!"))
					
					// Visual effect
					new /obj/effect/temp_visual/heal(get_turf(H_target), "#FF0000")
			else
				to_chat(H_user, span_warning("You don't have a [slot] to sacrifice!"))

/obj/effect/proc_holder/spell/invoked/damage_link
	name = "Shared Penance"
	desc = "Transfer a portion of your current suffering to your target, making them bear some of your pain."
	clothes_req = FALSE
	human_req = TRUE
	charge_max = 600  // 1 minute cooldown
	cooldown_min = 300 // 30 seconds minimum cooldown
	range = -1        // Infinite range
	invocation = "Share in my suffering!"
	invocation_type = "shout"
	action_icon_state = "damage_link"
	school = "holy"
	
/obj/effect/proc_holder/spell/invoked/damage_link/cast(atom/target, mob/user)
	if(!isliving(target))
		to_chat(user, span_warning("You can only cast this on living beings!"))
		return
	
	var/mob/living/carbon/human/H_target = target
	var/mob/living/carbon/human/H_user = user
	if(!istype(H_user) || !istype(H_target))
		to_chat(user, span_warning("This spell only works on humans!"))
		return
	
	if(H_target.stat == DEAD)
		to_chat(user, span_warning("[H_target] is dead!"))
		return
		
	to_chat(user, span_notice("You prepare to share your suffering with [H_target]..."))
	to_chat(H_target, span_warning("[user] begins a ritual to share their suffering with you!"))
	
	if(do_after(user, 30, target = H_target))
		// Calculate damage to transfer (30% of user's current damage)
		var/damage_to_transfer = H_user.getBruteLoss() * 0.3
		
		if(damage_to_transfer < 5)
			to_chat(user, span_warning("You aren't suffering enough to share your pain!"))
			return
			
		// Apply the damage transfer
		H_user.adjustBruteLoss(-damage_to_transfer)
		H_target.adjustBruteLoss(damage_to_transfer)
		
		// Visual and sound effects
		new /obj/effect/temp_visual/heal(get_turf(H_user), "#FF0000")
		new /obj/effect/temp_visual/heal(get_turf(H_target), "#FF0000")
		
		to_chat(user, span_notice("You transfer some of your suffering to [H_target]."))
		to_chat(H_target, span_danger("You feel [user]'s pain flowing into you!"))
		
		// Check for additional damage types
		var/burn_damage = H_user.getFireLoss() * 0.3
		if(burn_damage > 5)
			H_user.adjustFireLoss(-burn_damage)
			H_target.adjustFireLoss(burn_damage)
			
		var/tox_damage = H_user.getToxLoss() * 0.3
		if(tox_damage > 5)
			H_user.adjustToxLoss(-tox_damage)
			H_target.adjustToxLoss(tox_damage)
			
		var/oxy_damage = H_user.getOxyLoss() * 0.3
		if(oxy_damage > 5)
			H_user.adjustOxyLoss(-oxy_damage)
			H_target.adjustOxyLoss(oxy_damage)

/obj/effect/proc_holder/spell/targeted/burden_exchange
	name = "Exchange of Burdens"
	desc = "Switch places with your target, taking their physical burden upon yourself."
	clothes_req = FALSE
	human_req = TRUE
	charge_max = 300  // 30 seconds cooldown
	cooldown_min = 150 // 15 seconds minimum cooldown
	range = -1        // Infinite range
	invocation = "Let us trade places in this trial!"
	invocation_type = "shout"
	action_icon_state = "burden_exchange"
	school = "holy"
	
/obj/effect/proc_holder/spell/targeted/burden_exchange/cast(list/targets, mob/user)
	if(!targets.len)
		return
		
	var/mob/living/carbon/human/H_target = targets[1]
	var/mob/living/carbon/human/H_user = user
	
	if(!istype(H_user) || !istype(H_target))
		to_chat(user, span_warning("This spell only works on humans!"))
		return
	
	if(H_target.stat == DEAD)
		to_chat(user, span_warning("[H_target] is dead!"))
		return
		
	if(H_target.anchored || H_user.anchored)
		to_chat(user, span_warning("Something is preventing the exchange!"))
		return
		
	to_chat(user, span_notice("You prepare to exchange places with [H_target]..."))
	to_chat(H_target, span_warning("[user] begins a ritual to switch places with you!"))
	
	if(do_after(user, 10, target = H_target))
		// Store positions
		var/turf/user_turf = get_turf(H_user)
		var/turf/target_turf = get_turf(H_target)
		
		// Visual effects at both locations
		new /obj/effect/temp_visual/heal(user_turf, "#FF0000")
		new /obj/effect/temp_visual/heal(target_turf, "#FF0000")
		
		// Perform the swap
		H_user.forceMove(target_turf)
		H_target.forceMove(user_turf)
		
		// Messages
		to_chat(user, span_notice("You switch places with [H_target]!"))
		to_chat(H_target, span_warning("[user] has switched places with you!"))
		
		// Additional visual effect after the swap
		new /obj/effect/temp_visual/heal(get_turf(H_user), "#FF0000")
		new /obj/effect/temp_visual/heal(get_turf(H_target), "#FF0000")
