/mob/living/carbon/human/species/tabaxi
	race = /datum/species/tabaxi

/datum/species/tabaxi
	name = "Tabaxi"
	id = "tabaxi"

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	desc = "<b>Tabaxi</b><br>\
		Hailing from the south and southwest, the Tabaxi are most at home in the deserts of Valoria and Zybantine. \
		Their bodies tending to be slender, with a layer of fur of many different patterns. \
		Quick as a whip, the Tabaxi make up in speed what they lack in pure strength. \
		Tabaxi are considered smooth talkers, and many of them take up positions as gamblers and minstrels. \
		Astrata, the Firstborn of Psydon and Sun Goddess is their preferred god of worship."

	skin_tone_wording = "Fur Colors"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE, MUTCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP,TRAIT_NOFALLDAMAGE1, TRAIT_NIGHT_VISION, TRAIT_WILD_EATER,)
	possible_ages = ALL_AGES_LIST
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'

	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1)
		)
	race_bonus = list(STAT_CONSTITUTION = 1)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/half_darksight, // The eyes get replaced by the customizer, so this is here for a backup or in case of admin shenanigans
		ORGAN_SLOT_EARS = /obj/item/organ/ears/tabaxi,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_ANUS = /obj/item/organ/filling_organ/anus,
		//ORGAN_SLOT_TAIL = /obj/item/organ/tail/cat, //Commenting out due to use of customizer organs.
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/cat,
		)
	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/half_darksight,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/snout/tabaxi,
		/datum/customizer/organ/ears/tabaxi,
		/datum/customizer/organ/tail/tabaxi,
		/datum/customizer/organ/testicles/external,
		/datum/customizer/organ/penis/feline,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal,
		/datum/customizer/organ/vagina/animal,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/bellysocks,
		/datum/body_marking_set/bellysockstertiary,
		/datum/body_marking_set/belly,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/plain,
		/datum/body_marking/tiger,
		/datum/body_marking/tiger/dark,
		/datum/body_marking/sock,
		/datum/body_marking/socklonger,
		/datum/body_marking/tips,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/butt,
		/datum/body_marking/tie,
		/datum/body_marking/tiesmall,
		/datum/body_marking/backspots,
		/datum/body_marking/front,
		/datum/body_marking/tonage,
		/datum/body_marking/splotches,
		/datum/body_marking/splotcheswap,
		/datum/body_marking/spotted,
	)
	languages = list(
		/datum/language/common,
		/datum/language/beast,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/fur,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)

/datum/species/tabaxi/check_roundstart_eligible()
	return TRUE

/datum/species/tabaxi/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/tabaxi/get_skin_list()
	return list(
		"Orange" = ORANGE_FUR,
		"Light grey" = LIGHTGREY_FUR,
		"Dark grey" = DARKGREY_FUR,
		"Light orange" = LIGHTORANGE_FUR,
		"Light brown" = LIGHTBROWN_FUR,
		"White brown" = WHITEBROWN_FUR,
		"Dark brown" = DARKBROWN_FUR,
		"Black" = BLACK_FUR,
	)

/datum/species/tabaxi/get_random_features()
	var/list/returned = MANDATORY_FEATURE_LIST
	var/main_color
	var/random = rand(1,8)
	//Choose from a variety of mostly brightish, animal, matching colors
	switch(random)
		if(1)
			main_color = ORANGE_FUR
		if(2)
			main_color = LIGHTGREY_FUR
		if(3)
			main_color = DARKGREY_FUR
		if(4)
			main_color = LIGHTORANGE_FUR
		if(5)
			main_color = LIGHTBROWN_FUR
		if(6)
			main_color = WHITEBROWN_FUR
		if(7)
			main_color = DARKBROWN_FUR
		if(8)
			main_color = BLACK_FUR
	returned["mcolor"] = main_color
	returned["mcolor2"] = main_color
	returned["mcolor3"] = main_color
	return returned

/datum/species/tabaxi/get_random_body_markings(list/passed_features)
	return assemble_body_markings_from_set(GLOB.body_marking_sets_by_type[/datum/body_marking_set/tiger_dark], passed_features, src)

/datum/species/tabaxi/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/tabaxi/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
