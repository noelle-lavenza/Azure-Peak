/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = YEOMEN
	faction = "Station"
	tutorial = "You have worked sleepless nights on honing your craft. From sacks, to tapestry and luxurious clothing, there is little you cannot sew into existence. Use your storefront to turn even the ugliest peasant into a proper gentleman; who knows, even the nobility may pay you a visit."
	total_positions = 1
	spawn_positions = 1
	display_order = 6
	min_pq = 0
	selection_color = JCOLOR_YEOMAN
	allowed_races = RACES_ALL_KINDS
	display_order = JDO_TAILOR
	outfit = /datum/outfit/job/roguetown/tailor
	give_bank_account = 16
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_MASTER, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, SKILL_LEVEL_EXPERT, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, SKILL_LEVEL_NOVICE, TRUE)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights
	belt = /obj/item/storage/belt/rogue/leather/cloth
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/huntingknife/scissors/steel
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle, /obj/item/roguekey/tailor)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	else if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("speed", 1)
	H.change_stat("strength", -1)
