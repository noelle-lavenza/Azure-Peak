/datum/advclass/sawbones // doctor class. like the pilgrim, but more evil
	name = "Sawbones"
	tutorial = "It was an accident! Your patient wasn't using his second kidney, anyway. After an unfortunate 'misunderstanding' with the town and your medical practice, you know practice medicine on the run with your new associates. Business has never been better!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/nightman
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/surgery_bag/full/physician
	beltr = /obj/item/rogueweapon/sword/rapier
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/mattcoin
	backpack_contents = list(
					/obj/item/natural/worms/leech/cheele = 1,
					/obj/item/natural/cloth = 2,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/bedroll = 1,
					)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE) //needed for getting into hideout
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_LEGENDARY, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_JOURNEYMAN, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	H.change_stat("speed", 3)
	H.change_stat("intelligence", 4)
	H.change_stat("fortune", 3)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
