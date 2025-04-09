/datum/advclass/fisher
	name = "Fisher"
	tutorial = "You are a fisherman, with your bag of bait and your fishing rod, you are one of few who can reliably get a stable source of meat around here"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/fisher

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/fisher/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE) //Wrestling down those nasty carp.
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_EXPERT, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, SKILL_LEVEL_NOVICE, TRUE)

		H.change_stat("intelligence", 1)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, SKILL_LEVEL_MASTER, TRUE)
		else
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, SKILL_LEVEL_EXPERT, TRUE)
	if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		head = /obj/item/clothing/head/roguetown/fisherhat
		mouth = /obj/item/rogueweapon/huntingknife
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		backl = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather
		backr = /obj/item/fishingrod
		beltr = /obj/item/cooking/pan
		beltl = /obj/item/flint
		backpack_contents = list(
							/obj/item/natural/worms = 2,
							/obj/item/rogueweapon/shovel/small = 1,
							/obj/item/flashlight/flare/torch = 1,
							)
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		head = /obj/item/clothing/head/roguetown/fisherhat
		mouth = /obj/item/rogueweapon/huntingknife
		backl = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather
		backr = /obj/item/fishingrod
		beltr = /obj/item/cooking/pan
		beltl = /obj/item/flint
		backpack_contents = list(
							/obj/item/natural/worms = 2,
							/obj/item/rogueweapon/shovel/small = 1,
							/obj/item/flashlight/flare/torch = 1,
							)
