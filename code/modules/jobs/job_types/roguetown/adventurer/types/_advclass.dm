/datum/advclass
	var/name
	var/outfit
	var/tutorial = "Choose me!"
	var/list/allowed_sexes
	var/list/allowed_races = RACES_ALL_KINDSPLUS
	var/list/allowed_patrons
	var/list/allowed_ages
	var/pickprob = 100
	var/maximum_possible_slots = -1
	var/total_slots_occupied = 0
	var/min_pq = -100

	var/horse = FALSE
	var/vampcompat = TRUE
	var/list/traits_applied
	var/cmode_music
	var/f_title
	var/list/spells

	/// This class is immune to species-based swapped gender locks
	var/immune_to_genderswap = FALSE

	//What categories we are going to sort it in
	var/list/category_tags = list(CTAG_DISABLED)

/datum/advclass/proc/equipme(mob/living/carbon/human/H)
	// input sleeps....
	set waitfor = FALSE
	if(!H)
		return FALSE

	if(outfit)
		H.equipOutfit(outfit)

	post_equip(H)

	H.advjob = name

	//sleep(1)
	//testing("[H] spawn troch")

/* // This is what put the torch in adventurers' hands, causing the spam
	var/obj/item/flashlight/flare/torch/T = new()
	T.spark_act()
	H.put_in_hands(T, forced = TRUE)
*/

	//framework for being able to list spells instead of individually input them
	var/list/skills
	var/list/roundstart_experience
	roundstart_experience = skills
	if(roundstart_experience)
		var/mob/living/carbon/human/experiencer = H
		for(var/i in roundstart_experience)
			experiencer.mind.adjust_experience(i, roundstart_experience[i], TRUE)


	add_spells(H)
	//framework end
	var/turf/TU = get_turf(H)
	if(TU)
		if(horse)
			new horse(TU)

	for(var/trait in traits_applied)
		ADD_TRAIT(H, trait, ADVENTURER_TRAIT)

	// After the end of adv class equipping, apply a SPECIAL trait if able
	apply_character_post_equipment(H)

/datum/advclass/proc/post_equip(mob/living/carbon/human/H)
	addtimer(CALLBACK(H,TYPE_PROC_REF(/mob/living/carbon/human, add_credit)), 20)
	if(cmode_music)
		H.cmode_music = cmode_music

/*
	Whoa! we are checking requirements here!
	On the datum! Wow!
*/
/datum/advclass/proc/check_requirements(mob/living/carbon/human/H)

	var/datum/species/pref_species = H.dna.species
	var/list/local_allowed_sexes = list()
	if(length(allowed_sexes))
		local_allowed_sexes |= allowed_sexes
	if(!immune_to_genderswap && pref_species?.gender_swapping)
		if(MALE in allowed_sexes)
			local_allowed_sexes -= MALE
			local_allowed_sexes += FEMALE
		if(FEMALE in allowed_sexes)
			local_allowed_sexes -= FEMALE
			local_allowed_sexes += MALE
	if(length(local_allowed_sexes) && !(H.gender in local_allowed_sexes))
		return FALSE

	if(length(allowed_races) && !(H.dna.species.type in allowed_races))
		return FALSE

	if(length(allowed_ages) && !(H.age in allowed_ages))
		return FALSE

	if(length(allowed_patrons) && !(H.patron in allowed_patrons))
		return FALSE

	if(maximum_possible_slots > -1)
		if(total_slots_occupied >= maximum_possible_slots)
			return FALSE

	if(min_pq != -100) // If someone sets this we actually do the check.
		if(!(get_playerquality(H.client.ckey) >= min_pq))
			return FALSE

	if(prob(pickprob))
		return TRUE

// Basically the handler has a chance to plus up a class, heres a generic proc you can override to handle behavior related to it.
// For now you just get an extra stat in everything depending on how many plusses you managed to get.
/datum/advclass/proc/boost_by_plus_power(plus_factor, mob/living/carbon/human/H)
	for(var/S in MOBSTATS)
		H.change_stat(S, plus_factor)


//Final proc in the set for really retarded shit
///datum/advclass/proc/extra_slop_proc_ending(mob/living/carbon/human/H)


//framework for being able to list spells instead of putting them individually
/datum/advclass/proc/add_spells(mob/living/H)
	if(spells && H.mind)	
		for(var/S in spells)
			if(H.mind.has_spell(S))
				continue
			H.mind.AddSpell(new S)

/datum/advclass/proc/remove_spells(mob/living/H)
	if(spells && H.mind)	
		for(var/S in spells)
			if(!H.mind.has_spell(S))
				continue
			H.mind.RemoveSpell(S)
//framework end
