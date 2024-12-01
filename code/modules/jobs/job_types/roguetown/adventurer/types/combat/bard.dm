
/datum/advclass/bard
	name = "Bard"
	tutorial = "Bards make up one of the largest populations of \
	registered adventurers in Astralith, mostly because they are \
	the last ones in a party to die. Their wish is to experience \
	the greatest adventures of the age and write amazing songs about them."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/bard
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_jester.ogg'

/datum/outfit/job/roguetown/adventurer/bard/pre_equip(mob/living/carbon/human/H)
	..() // The entertaining jack of all trades, uniquely handy with crossbows and swords. They're incredibly well travelled, can sneak, steal and survive on their own.
	H.adjust_blindness(-3)
	var/classes = list("Bard","Skald","Arcanist",)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Bard")
			H.set_blindness(0)
			to_chat(H, span_warning("Bards make their fortunes in brothels, flop houses and taverns -- gaining fame for their songs and legends. If there is any truth to them, that is."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 5, TRUE)
			head = /obj/item/clothing/head/roguetown/bardhat
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			cloak = /obj/item/clothing/cloak/raincloak/blue
			if(prob(50))
				cloak = /obj/item/clothing/cloak/raincloak/red
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife/idagger
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 2)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)
		if("Skald")
			H.set_blindness(0)
			to_chat(H, span_warning("Skalds are wandering storytellers, and for many villages they are local historians keeping the tales of great legends and heroes alive."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 4, TRUE)
			head = /obj/item/clothing/head/roguetown/bardhat
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			cloak = /obj/item/clothing/cloak/raincloak/blue
			if(prob(50))
				cloak = /obj/item/clothing/cloak/raincloak/red
			backl = /obj/item/storage/backpack/rogue/satchel
			l_hand = /obj/item/rogueweapon/huntingknife/idagger
			beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
			l_hand = /obj/item/rogueweapon/sword/iron
			H.change_stat("constitution", 2)
			H.change_stat("strength", 2)
			H.change_stat("speed", 1)
			H.change_stat("endurance", 1)
		if("Arcanist")
			H.set_blindness(0)
			to_chat(H, span_warning("Many bards can craft musical sorceries, so it makes sense some pick up traditional sorcery. Not quite as good as the real deal, of course."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 5, TRUE)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/spitfire)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			head = /obj/item/clothing/head/roguetown/bardhat
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			cloak = /obj/item/clothing/cloak/raincloak/purple
			if(prob(50))
				cloak = /obj/item/clothing/cloak/raincloak/green
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 2)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

	var/colleges = list(
		"College of Lore",
		"College of Eloquence",
		"College of Spirits",
		"College of Swords",
		"College of Whispers")
	var/collegechoice = input("Choose your college", "Available colleges") as anything in colleges
	switch(collegechoice)
		if("College of Lore")
			H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)

		if("College of Eloquence")
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

		if("College of Spirits")
			ADD_TRAIT(H, TRAIT_SPIRITUAL, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)

		if("College of Swords")
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.give_fightingstyle() //gives one fighting style

		if("College of Whispers")
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
			backpack_contents = list(/obj/item/lockpickring/mundane)

	if(H.dna?.species)
		if(iself(H) || ishalfelf(H))
			backr = /obj/item/rogue/instrument/harp
		else if(ishumannorthern(H))
			backr = /obj/item/rogue/instrument/lute
		else if(isdwarf(H))
			backr = /obj/item/rogue/instrument/accord
		else if(istiefling(H) /*|| isargonian(H)*/)
			backr = /obj/item/rogue/instrument/guitar
		else
			backr = /obj/item/rogue/instrument/lute

	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)	//You have speed, use it. What musucian plays with cumbersome armor anyway?
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_USEMAGICITEM, TRAIT_GENERIC)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
