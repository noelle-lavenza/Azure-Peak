/datum/advclass/thug
	name = "Thug"
	tutorial = "You might not have ever been the smartest person in town. But you may have been the sturdiest. Good enough for soilers to pay you to cart around saigashit. Good enough for miners to offload some of their work to you. Good enough for a carpenter who doesn't want to pay top mams for chopped wood. And good enough for just about anyone who wants a meathead to look scary with."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/thug
	category_tags = list(CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/thug/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_APPRENTICE, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/labor/mining, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_NOVICE, TRUE)
	head = /obj/item/clothing/head/roguetown/roguehood/random 
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/flashlight/flare/torch
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1)
