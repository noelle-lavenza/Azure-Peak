/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druidess"
	flag = DRUID
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to dendor on the outfit anyways lol
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You have always been drawn to the wild, and the wild drawn to you. When your calling came, it was from Dendor. Your patron claims dominion over all nature--promising bounties to those who act in his name to bring balance to His domain. The forest is the most comfortable place for you, toiling alongside soilsons and soilbrides...although sometimes what lies beyond the gates fills your soul with a feral yearning."

	display_order = JDO_DRUID
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	cmode_music = 'sound/music/combat_druid.ogg'

	//You're.. not REALLY a full-on church member, but being a druid implies you became a clergy-man of some sort; even if it's non-organized. So, still shouldn't be noble.
	virtue_restrictions = list(/datum/virtue/utility/noble)

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/rogueweapon/whip //The whip itself is not often associated to many jobs. Druids feel like a thematic choice to have a self-defense whip
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/dendormask
	wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	backpack_contents = list(/obj/item/ritechalk)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_EXPERT, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, SKILL_LEVEL_JOURNEYMAN, TRUE) //Shapeshifting.
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, SKILL_LEVEL_EXPERT, TRUE) //Druids know the forest and when it has been disturbed
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_NOVICE, TRUE) //To help them defend themselves with parrying
		H.put_in_hands(new /obj/item/rogueweapon/woodstaff(H), TRUE) //To encourage them to wander the forests and to help defend themselves
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, SKILL_LEVEL_NOVICE, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)
		H.ambushable = FALSE

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
