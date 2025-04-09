/datum/advclass/mercenary/desert_rider
	name = "Desert Rider Mercenary"
	tutorial = "Blood, like the desert sand, stains your hands, a crimson testament to the gold you covet. A desert rider, renowned mercenary of the far east, your shamshir whispers tales of centuries-old tradition. Your loyalty, a fleeting mirage in the shifting sands, will yield to the allure of fortune."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider
	traits_applied = list(TRAIT_OUTLANDER)
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg' //GREATEST COMBAT TRACK IN THE GAME SO FAR BESIDES MAYBE MANIAC2.OGG
	classes = list("Jannisary" = "The Janissaries are the Empire's elite infantry units, wielding mace and shield. We do not break.",
					"Zybek" = "Ranesheni 'Blade Dancers' famed and feared the world over. Their expertise in blades both long and short is well known.",
					"Almah" = "Almah are those skilled in both magyck and swordsmanship, but excelling in nothing.")


/datum/outfit/job/roguetown/mercenary/desert_rider/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Janissary","Zeybek","Almah")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Janissary")
			H.set_blindness(0)
			to_chat(H, span_warning("The Janissaries are the Empire's elite infantry units, wielding mace and shield. We do not break."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("perception", -1)
			H.change_stat("speed", 2)
			backl = /obj/item/rogueweapon/shield/wood
			r_hand = /obj/item/rogueweapon/mace/steel
			neck = /obj/item/clothing/neck/roguetown/chaincoif/full
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			pants = /obj/item/clothing/under/roguetown/chainlegs
			backr = /obj/item/storage/backpack/rogue/satchel/black
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/rogueweapon/huntingknife/idagger/navaja, /obj/item/clothing/neck/roguetown/shalal)
			H.grant_language(/datum/language/celestial)

		if("Zeybek")
			H.set_blindness(0)
			to_chat(H, span_warning("Ranesheni 'Blade Dancers' are famed and feared the world over. Their expertise in blades both long and short is well known."))
			H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE) 
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_JOURNEYMAN, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			H.change_stat("endurance", 2)
			H.change_stat("intelligence", 1)
			H.change_stat("speed", 3)
			backr = /obj/item/storage/backpack/rogue/satchel/black
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/rogueweapon/huntingknife/idagger/navaja, /obj/item/clothing/neck/roguetown/shalal)
			backl = /obj/item/rogueweapon/sword/sabre/shamshir
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			H.grant_language(/datum/language/celestial)
			var/weapons = list("Shamshir","Whips and Knives",)
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Shamshir")
					backl = /obj/item/rogueweapon/sword/sabre/shamshir
				if("Whips and Knives")	///They DO enslave people after all
					r_hand = /obj/item/rogueweapon/whip
					l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying

		if("Almah")
			H.set_blindness(0)
			to_chat(H, span_warning("Almah are those skilled in both magyck and swordsmanship, but excelling in nothing."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_spellpoints(1)
			ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
			H.change_stat("perception", -1)
			H.change_stat("endurance", 2)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", 3)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/push_spell)
			r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/magered
			backr = /obj/item/storage/backpack/rogue/satchel/black
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/rogueweapon/huntingknife/idagger/navaja, /obj/item/clothing/neck/roguetown/shalal, /obj/item/spellbook_unfinished/pre_arcyne)
			backl = /obj/item/rogueweapon/sword/sabre/shamshir
			H.grant_language(/datum/language/celestial)
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord

	shoes = /obj/item/clothing/shoes/roguetown/shalal
	head = /obj/item/clothing/head/roguetown/roguehood/shalal
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/flashlight/flare/torch
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather



