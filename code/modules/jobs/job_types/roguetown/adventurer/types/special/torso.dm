/datum/advclass/torso
	name = "Torso"
	tutorial = "Some horrible accident in the forest away all of your limbs!\nSurvival will be a true TRIUMPH."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/torso
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_STEELHEARTED)
	category_tags = list(CTAG_DISABLED)

/datum/outfit/job/roguetown/adventurer/torso/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT) ,TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, rand(SKILL_LEVEL_NONE,SKILL_LEVEL_EXPERT), TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 3)
	H.change_stat("constitution", 3)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/huntingknife

	var/static/list/safe_bodyzones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
	)
	for(var/obj/item/bodypart/limb in H.bodyparts)
		if(limb.body_zone in safe_bodyzones)
			continue
		limb.drop_limb()
		qdel(limb)
