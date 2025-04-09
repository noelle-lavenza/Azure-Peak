#define ZOMBIE_FIRST_BITE_CHANCE 15
#define ZOMBIE_BITE_CONVERSION_TIME 1.5 MINUTES

/datum/antagonist/zombie
	name = "Deadite"
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "zombie"
	show_in_roundend = FALSE
	rogue_enabled = TRUE
	/// SET TO FALSE IF WE DON'T TURN INTO ROTMEN WHEN REMOVED
	var/become_rotman = FALSE
	var/zombie_start
	var/revived = FALSE
	var/next_idle_sound

	// CACHE VARIABLES SO ZOMBIFICATION CAN BE CURED
	var/was_i_undead = FALSE
	var/special_role
	var/ambushable = TRUE
	var/soundpack_m
	var/soundpack_f

	var/STASTR
	var/STASPD
	var/STAINT
	var/STACON
	var/STAEND
	var/cmode_music
	var/list/base_intents

	/// Whether or not we have been turned
	var/has_turned = FALSE
	/// Last time we bit someone - Zombies will try to bite after 10 seconds of not biting
	var/last_bite
	/// Traits applied to the owner mob when we turn into a zombie
	var/static/list/traits_zombie = list(
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOROGSTAM,
		TRAIT_NOMOOD,
		TRAIT_NOHUNGER,
		TRAIT_EASYDISMEMBER,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
		TRAIT_NOBREATH,
		TRAIT_NOBREATH,
		TRAIT_TOXIMMUNE,
		TRAIT_CHUNKYFINGERS,
		TRAIT_NOSLEEP,
		TRAIT_BASHDOORS,
		TRAIT_SPELLCOCKBLOCK,
		TRAIT_BLOODLOSS_IMMUNE,
		TRAIT_ZOMBIE_SPEECH,
		TRAIT_ZOMBIE_IMMUNE,
		TRAIT_ROTMAN,
		TRAIT_NORUN
	)
	/// Traits applied to the owner when we are cured and turn into just "rotmen"
	var/static/list/traits_rotman = list(
		TRAIT_EASYDISMEMBER,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
		TRAIT_NOBREATH,
		TRAIT_TOXIMMUNE,
		TRAIT_ZOMBIE_IMMUNE,
		TRAIT_ROTMAN,
	)

/datum/antagonist/zombie/examine_friendorfoe(datum/antagonist/examined_datum,mob/examiner,mob/examined)
	if(istype(examined_datum, /datum/antagonist/vampirelord))
		var/datum/antagonist/vampirelord/V = examined_datum
		if(!V.disguised)
			return span_boldnotice("Another deadite.")
	if(istype(examined_datum, /datum/antagonist/zombie))
		var/datum/antagonist/zombie/fellow_zombie = examined_datum
		return span_boldnotice("Another deadite. [fellow_zombie.has_turned ? "My ally." : span_warning("Hasn't turned yet.")]")
	if(istype(examined_datum, /datum/antagonist/skeleton))
		return span_boldnotice("Another deadite.")

//Housekeeping/saving variables from pre-zombie 

/*Death transformation process goes:
	death -> 
	/mob/living/carbon/human/death(gibbed) -> 
	zombie_check_can_convert() -> 
	zombie.on_gain() -> 
	rotting.dm process -> 
	time passes -> 
	zombie.wake_zombie() -> 
	transform
*/
/*
	Deadite transformation is 2 ways. First is on the initial bite (low chance) and second is on being chewed on.

	Initial bite is: other_mobs.dm, /mob/living/carbon/onbite(mob/living/carbon/human/user) ->
	bite_victim.zombie_infect_attempt() -> 
	attempt_zombie_infection(src, "bite", ZOMBIE_BITE_CONVERSION_TIME) -> rng check here
	time passes ->
	wake_zombie.

	Wound transformation goes: grabbing.dm, /obj/item/grabbing/bite/proc/bitelimb(mob/living/carbon/human/user) ->
	/datum/wound/proc/zombie_infect_attempt() -> 
	human_owner.attempt_zombie_infection(src, "wound", zombie_infection_time) ->
	time passes -> 
	wake_zombie

	Infection transformation process goes -> infection -> timered transform in zombie_infect_attempt() [drink red/holy water and kill timer?] -> /datum/antagonist/zombie/proc/wake_zombie -> zombietransform
*/
/datum/antagonist/zombie/on_gain(admin_granted = FALSE)
	var/mob/living/carbon/human/zombie = owner?.current
	if(zombie)
		var/obj/item/bodypart/head = zombie.get_bodypart(BODY_ZONE_HEAD)
		if(!head)
			qdel(src)
			return
	zombie_start = world.time
	was_i_undead = zombie.mob_biotypes & MOB_UNDEAD
	special_role = zombie.mind?.special_role
	ambushable = zombie.ambushable
	if(zombie.dna?.species)
		soundpack_m = zombie.dna.species.soundpack_m
		soundpack_f = zombie.dna.species.soundpack_f
	base_intents = zombie.base_intents

	//Just need to clear it to snapshot. May get things we don't want to get.
	for(var/status_effect in zombie.status_effects)
		zombie.remove_status_effect(status_effect)

	src.STASTR = zombie.STASTR
	src.STASPD = zombie.STASPD
	src.STAINT = zombie.STAINT
	src.STACON = zombie.STACON
	src.STAEND = zombie.STAEND
	cmode_music = zombie.cmode_music

	//Special because deadite status is latent as opposed to the others. 
	if(admin_granted)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(wake_zombie), zombie, FALSE, TRUE), 5 SECONDS, TIMER_STOPPABLE)
	return ..()

/*
	CHECK HERE IF ANY UN-ZOMBIFICATION ISSUES.
*/
///Remove zombification - cure rot, surgical rot remove
/datum/antagonist/zombie/on_removal()
	var/mob/living/carbon/human/zombie = owner?.current
	if(zombie)

		zombie.verbs -= /mob/living/carbon/human/proc/zombie_seek
		zombie.mind?.special_role = special_role
		zombie.ambushable = ambushable
		
		if(zombie.dna?.species)
			zombie.dna.species.soundpack_m = soundpack_m
			zombie.dna.species.soundpack_f = soundpack_f
		zombie.base_intents = base_intents
		zombie.update_a_intents()
		zombie.aggressive = FALSE
		zombie.mode = NPC_AI_OFF
		if(zombie.charflaw)
			zombie.charflaw.ephemeral = FALSE
		zombie.update_body()

		zombie.STASTR = src.STASTR
		zombie.STASPD = src.STASPD
		zombie.STAINT = src.STAINT
		zombie.STACON = src.STACON
		zombie.STAEND = src.STAEND



		GLOB.dead_mob_list -= zombie // Remove it from global dead/alive mob list here here, if they're a zombie they probably died.
									 // There is a better way to maintain it but needs overhaul. Will cover the two methods of zombie
		GLOB.alive_mob_list += zombie// in both cure rot and medicine. 

		zombie.cmode_music = cmode_music

		for(var/trait in traits_zombie)
			REMOVE_TRAIT(zombie, trait, "[type]")
		zombie.remove_client_colour(/datum/client_colour/monochrome)

		if(has_turned && become_rotman)
			zombie.STACON = max(zombie.STACON - 2, 1) //ur rotting bro
			zombie.STASPD = max(zombie.STASPD - 3, 1)
			zombie.STAINT = max(zombie.STAINT - 3, 1)
			for(var/trait in traits_rotman)
				ADD_TRAIT(zombie, trait, "[type]")
			to_chat(zombie, span_green("I no longer crave for flesh... <i>But I still feel ill.</i>"))
		else
			if(!was_i_undead)
				zombie.mob_biotypes &= ~MOB_UNDEAD
			zombie.faction -= "undead"
			zombie.faction -= "zombie"
			zombie.faction += "neutral"
			zombie.regenerate_organs()
			if(has_turned)
				to_chat(zombie, span_green("I no longer crave for flesh..."))

		for(var/obj/item/bodypart/zombie_part as anything in zombie.bodyparts) //Cure all limbs
			zombie_part.rotted = FALSE
			zombie_part.update_disabled()
			zombie_part.update_limb()
		zombie.update_body()
	// Bandaid to fix the zombie ghostizing not allowing you to re-enter
	if(zombie)
		var/mob/dead/observer/ghost = zombie.get_ghost(TRUE)
		if(ghost)
			ghost.can_reenter_corpse = TRUE
	return ..()

//Housekeeping's done. Transform into zombie.
/datum/antagonist/zombie/proc/transform_zombie()
	var/mob/living/carbon/human/zombie = owner.current
	if(!zombie)
		qdel(src)
		return
	var/obj/item/bodypart/head = zombie.get_bodypart(BODY_ZONE_HEAD)
	if(!head) //If no head then unable to become zombie
		qdel(src)
		return

	revived = TRUE //so we can die for real later
	
	for(var/trait_applied in traits_zombie)
		ADD_TRAIT(zombie, trait_applied, "[type]")
	if(zombie.mind)
		special_role = zombie.mind.special_role
		zombie.mind.special_role = name
	if(zombie.dna?.species)
		soundpack_m = zombie.dna.species.soundpack_m
		soundpack_f = zombie.dna.species.soundpack_f
		zombie.dna.species.soundpack_m = new /datum/voicepack/zombie/m()
		zombie.dna.species.soundpack_f = new /datum/voicepack/zombie/f()
	base_intents = zombie.base_intents
	zombie.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	zombie.update_a_intents()
	zombie.aggressive = TRUE
	zombie.mode = NPC_AI_IDLE
	zombie.handle_ai()
	ambushable = zombie.ambushable
	zombie.ambushable = FALSE

	if(zombie.charflaw)
		zombie.charflaw.ephemeral = TRUE
	zombie.mob_biotypes |= MOB_UNDEAD
	zombie.faction += "undead"
	zombie.faction += "zombie"
	zombie.faction -= "neutral"
	zombie.verbs |= /mob/living/carbon/human/proc/zombie_seek
	for(var/obj/item/bodypart/zombie_part as anything in zombie.bodyparts)
		if(!zombie_part.rotted && !zombie_part.skeletonized)
			zombie_part.rotted = TRUE
		zombie_part.update_disabled()

	zombie.add_client_colour(/datum/client_colour/monochrome)
	var/obj/item/organ/eyes/eyes = zombie.getorganslot(ORGAN_SLOT_EYES) //Add zombie eyes(nightvision)
	if(eyes)
		eyes.Remove(zombie,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(zombie)

//Drop held items

	zombie.dropItemToGround(zombie.get_active_held_item(), TRUE)
	zombie.dropItemToGround(zombie.get_inactive_held_item(), TRUE)

//Add claws here if wanted.

	zombie.update_body()
	to_chat(zombie, span_narsiesmall("Hungry... so hungry... I CRAVE FLESH!"))
	zombie.cmode_music = 'sound/music/combat_weird.ogg'


	// This is the original first commit values for it, aka 5-7
	zombie.STASPD = rand(5,7)

	zombie.STAINT = 1
	last_bite = world.time
	has_turned = TRUE
	// Drop your helm and gorgies boy you won't need it anymore!!!
	var/static/list/removed_slots = list(
		SLOT_HEAD,
		SLOT_WEAR_MASK,
		SLOT_MOUTH,
		//SLOT_NECK,
	)
	for(var/slot in removed_slots)
		zombie.dropItemToGround(zombie.get_item_by_slot(slot), TRUE)


/datum/antagonist/zombie/greet()
	to_chat(owner.current, span_userdanger("Death is not the end..."))
	return ..()

/datum/antagonist/zombie/on_life(mob/user)
	if(!user || user.stat >= DEAD || !has_turned)
		return
	var/mob/living/carbon/human/zombie = user
	if(world.time > next_idle_sound)
		zombie.emote("idle")
		next_idle_sound = world.time + rand(5 SECONDS, 10 SECONDS)

/*
	Check for zombie infection post bite
		Bite chance is checked here
		Wound chance is checked in zombie_wound_infection.dm
*/
/mob/living/carbon/human/proc/attempt_zombie_infection(mob/living/carbon/human/source, infection_type, wake_delay = 0)
	var/mob/living/carbon/human/victim = src
	if (QDELETED(src) || stat >= DEAD)
		return FALSE

	var/datum/antagonist/zombie/victim_zombie = victim.mind?.has_antag_datum(/datum/antagonist/zombie)
	if (victim_zombie) //Check that the victim isn't already a zombie or on the way to becoming one
		return FALSE

	var/datum/antagonist/zombie/zombie_antag = source.mind?.has_antag_datum(/datum/antagonist/zombie)
	if (!zombie_antag || !zombie_antag.has_turned) //Check that the zombie who bit us is real
		return FALSE

	//How did the victim get infected
	switch (infection_type)
		if ("bite")
			if (!prob(ZOMBIE_FIRST_BITE_CHANCE)) // Chance to infect via first bite (rare)
				return FALSE
			to_chat(victim, span_danger("A growing cold seeps into my body. I feel horrible... REALLY horrible..."))
			mob_timers["puke"] = world.time
			vomit(1, blood = TRUE, stun = FALSE)

		if ("wound")	//Chance to infect via chewing to open wound
			flash_fullscreen("redflash3")
			to_chat(victim, span_danger("Ow! It hurts. I feel horrible... REALLY horrible..."))

	victim.zombie_check_can_convert() //They are given zombie antag mind here unless they're already an antag.

//Delay on waking up as a zombie. /proc/wake_zombie(mob/living/carbon/zombie, infected_wake = FALSE, converted = FALSE)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(wake_zombie), victim, FALSE, TRUE), wake_delay, TIMER_STOPPABLE)
	return zombie_antag

/*

*/
/mob/living/carbon/human/proc/zombie_infect_attempt()
	return attempt_zombie_infection(usr, "bite", ZOMBIE_BITE_CONVERSION_TIME)

/*
	Proc for our newly infected to wake up as a zombie
*/
/proc/wake_zombie(mob/living/carbon/zombie, infected_wake = FALSE, converted = FALSE)
	if (!zombie || QDELETED(zombie)) 
		return

	if (!istype(zombie, /mob/living/carbon/human)) // Ensure the zombie is human
		return

	var/obj/item/bodypart/head = zombie.get_bodypart(BODY_ZONE_HEAD)
	if (!head) // Missing head
		qdel(zombie)
		return

	if (zombie.stat != DEAD && infected_wake) // Died too hard
		qdel(zombie)
		return

	if (istype(zombie.loc, /obj/structure/closet/dirthole) || istype(zombie.loc, /obj/structure/closet/crate/coffin)) // Buried
		qdel(zombie)
		return

	// Heal the zombie
	zombie.blood_volume = BLOOD_VOLUME_NORMAL
	zombie.setOxyLoss(0, updating_health = FALSE, forced = TRUE) // Zombies don't breathe
	zombie.setToxLoss(0, updating_health = FALSE, forced = TRUE) // Zombies are immune to poison

	if (infected_wake || converted)
		zombie.adjustBruteLoss(-INFINITY, updating_health = FALSE, forced = TRUE)
		zombie.adjustFireLoss(-INFINITY, updating_health = FALSE, forced = TRUE)
		zombie.heal_wounds(INFINITY) // Heal all non-permanent wounds
		to_chat(zombie, span_userdanger("Your bones snap back into place and your flesh knits itself back together as you rise again in undeath."))

	zombie.stat = UNCONSCIOUS // Start unconscious
	zombie.updatehealth() // Then check if the mob should wake up
	zombie.update_mobility()
	zombie.update_sight()
	zombie.reload_fullscreen()

	var/datum/antagonist/zombie/zombie_antag = zombie.mind?.has_antag_datum(/datum/antagonist/zombie)
	if(zombie_antag)
		zombie_antag.transform_zombie()
	else
		CRASH("[zombie] tried to wake up as a zombie but did not have the antag set.")

	if (zombie.stat >= DEAD) // We couldn't bring them back to life as a zombie. Nothing we can do.
		qdel(zombie)
		return


	if (converted || infected_wake)
		zombie.flash_fullscreen("redflash3")
		zombie.emote("scream") // Warning for nearby players
		zombie.Knockdown(1)

///Making sure they're not any other antag as well as adding the zombie datum to their mind
/mob/living/carbon/human/proc/zombie_check_can_convert()
	if(!mind)
		return
	if(mind.has_antag_datum(/datum/antagonist/vampirelord))
		return
	if(mind.has_antag_datum(/datum/antagonist/werewolf))
		return
	if(mind.has_antag_datum(/datum/antagonist/zombie))
		return
	if(mind.has_antag_datum(/datum/antagonist/skeleton))
		return
	if(HAS_TRAIT(src, TRAIT_ZOMBIE_IMMUNE))
		return
	return mind.add_antag_datum(/datum/antagonist/zombie)
