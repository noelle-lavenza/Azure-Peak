/datum/job/roguetown/bapprentice
	title = "Smithy Apprentice"
	flag = APPRENTICE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT)

	tutorial = "Long hours and back-breaking work wouldn't even describe a quarter of what you do in a day for your Master. Its exhausting, filthy, and you have precious little free time; but someday you'll get your own smithy, and you'll have TWICE as many apprentices as your master does."

	outfit = /datum/outfit/job/roguetown/bapprentice
	display_order = JDO_APPRENTICE
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/bapprentice/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_NOVICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, SKILL_LEVEL_JOURNEYMAN, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, SKILL_LEVEL_EXPERT, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltr = /obj/item/roguekey/blacksmith
		cloak = /obj/item/clothing/cloak/apron/brown
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = null
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltr = /obj/item/roguekey/blacksmith
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
