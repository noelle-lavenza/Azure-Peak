/datum/advclass/whitecheese
	name = "WHITE CHEESE"
	allowed_sexes = list(MALE)
	allowed_races = list(/datum/species/human/northern)
	outfit = /datum/outfit/job/roguetown/adventurer/whitecheese
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_BREADY, TRAIT_STEELHEARTED)
	// oh god oh fuck this dont seem very safe to do
	// this looks kinda op so imma just leave it at patreon level 1 until someone puts this behind a different lock
	maximum_possible_slots = 1

	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/saigabuck/tame/saddled
	category_tags = list(CTAG_DISABLED)

/datum/outfit/job/roguetown/adventurer/whitecheese
	name = "WHITE CHEESE"

/datum/outfit/job/roguetown/adventurer/whitecheese/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_MASTER, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_MASTER, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, rand(SKILL_LEVEL_EXPERT,SKILL_LEVEL_MASTER), TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, rand(SKILL_LEVEL_NOVICE,SKILL_LEVEL_APPRENTICE), TRUE)

	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich

	H.dna.species.soundpack_m = new /datum/voicepack/male/evil/blkknight()

	H.change_stat("intelligence", 3)
	H.change_stat("strength", 4)
	H.change_stat("endurance", 4)
	H.change_stat("constitution", 4)
	H.change_stat("speed", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)

	H.ambushable = FALSE
