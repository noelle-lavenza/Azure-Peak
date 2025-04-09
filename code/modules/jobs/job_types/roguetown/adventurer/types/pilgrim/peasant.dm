/datum/advclass/peasant
	name = "Farmer"
	tutorial = "As a Peasant, you are a skilled farmer, able to grow a variety of crops \
	Join the local Soilsmen at their farm, or make your own little orchard."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/peasant
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/peasant/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/trou
	head = /obj/item/clothing/head/roguetown/armingcap
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	mouth = /obj/item/rogueweapon/huntingknife
	beltr = /obj/item/flint
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = null
	backpack_contents = list(
						/obj/item/seeds/wheat=1,
						/obj/item/seeds/apple=1,
						/obj/item/ash=1,
						/obj/item/flashlight/flare/torch = 1,
						)
	beltl = /obj/item/rogueweapon/sickle
	backr = /obj/item/rogueweapon/hoe
	H.change_stat("strength", 1)
	H.change_stat("intelligence", -1)
