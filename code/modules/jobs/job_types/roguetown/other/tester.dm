/datum/job/roguetown/tester
	title = "Tester"
	flag = TESTER
	department_flag = SLOP
	faction = "Station"
#ifdef TESTSERVER
	total_positions = 99
	spawn_positions = 99
#else
	total_positions = 0
	spawn_positions = 0
#endif
	min_pq = null //no pq
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = ""
	outfit = /datum/outfit/job/roguetown/tester
	plevel_req = 0
	display_order = JDO_MERCENARY

/datum/outfit/job/roguetown/tester/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	neck = /obj/item/roguekey/mercenary
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/rogueweapon/sword/sabre
	if(prob(50))
		beltr = /obj/item/rogueweapon/sword
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	pants = /obj/item/clothing/under/roguetown/trou/leather
	neck = /obj/item/clothing/neck/roguetown/gorget
	if(should_wear_femme_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/black
		beltr = /obj/item/rogueweapon/sword/sabre
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_MASTER), TRUE)
		H.change_stat("strength", 1)
