/datum/job/roguetown/tribalcook
	title = "Tribal Cook"
	flag = TRIBALCOOK
	department_flag = TRIBAL
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "Cook, farm, butcher. Make king or queen happy with apple pies! Don't forget about your brothers and sisters."
	cmode_music = 'sound/music/combat_gronn.ogg'

	outfit = /datum/outfit/job/roguetown/tribalcook
	display_order = JDO_TRIBALCOOK
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/tribalcook/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather/rope
	cloak = /obj/item/clothing/cloak/apron/cook
	neck = /obj/item/clothing/neck/roguetown/psicross/talisman
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/roguekey/tribe = 1)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 2, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("fortune", 1)
