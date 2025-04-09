/datum/advclass/trader
	name = "Trader"
	tutorial = "A traveling salesman, a peddler of goods - commerce is your expertise, and you've come to this land to make a fortune."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/trader
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	traits_applied = list(TRAIT_OUTLANDER, TRAIT_SEEPRICES)
	classes = list("Peddler" = "You make your coin peddling in spices and performing back-alley 'medical' procedures. Hope your patient didn't need that kidney.",
					"Brewer" = "You make your coin peddling imported alcohols from all over the world, though you're no stranger to the craft, and have experience brewing your own ale in a pinch.",
					"Jeweler" = "You make your coin peddling exotic jewelry, gems, and shiny things.",
					"Doomsayer" = "THE WORLD IS ENDING!!! At least, that's what you want your clients to believe. You'll offer them a safe place in the new world, of course - built by yours truly.",
					"Scholar" = "You are a scholar traveling the world in order to write a book about your ventures. You trade in stories and tales of your travels.",
					"Harlequin" = "You are a travelling entertainer - a jester by trade. Where you go, chaos follows - and mischief is made.")

/datum/outfit/job/roguetown/adventurer/trader/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Peddler","Brewer","Jeweler","Doomsayer","Scholar","Harlequin")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
	
		if("Peddler")
			to_chat(H, span_warning("You make your coin peddling in spices and performing back-alley 'medical' procedures. Hope your patient didn't need that kidney."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_JOURNEYMAN, TRUE)
			head = /obj/item/clothing/head/roguetown/roguehood
			mask = /obj/item/clothing/mask/rogue/facemask/steel
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/robe
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/storage/belt/rogue/surgery_bag/full
			beltl = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/reagent_containers/powder/spice = 2, /obj/item/reagent_containers/powder/ozium = 1, /obj/item/reagent_containers/powder/moondust = 2, /obj/item/rogueweapon/huntingknife = 1)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)

		if("Brewer")
			to_chat(H, span_warning("You make your coin peddling imported alcohols from all over the world, though you're no stranger to the craft, and have experience brewing your own ale in a pinch."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			mask = /obj/item/clothing/mask/rogue/ragmask/black
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			pants = /obj/item/clothing/under/roguetown/tights/black
			cloak = /obj/item/clothing/suit/roguetown/armor/longcoat
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/red
			belt = /obj/item/storage/belt/rogue/leather/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/rogueweapon/mace/cudgel
			beltl = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/beer/gronnmead = 1, /obj/item/reagent_containers/glass/bottle/rogue/beer/voddena = 1, /obj/item/reagent_containers/glass/bottle/rogue/beer/blackgoat = 1, /obj/item/reagent_containers/glass/bottle/rogue/elfred = 1, /obj/item/reagent_containers/glass/bottle/rogue/elfblue = 1, /obj/item/rogueweapon/huntingknife = 1)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 1)

		if ("Jeweler")
			to_chat(H, span_warning("You make your coin peddling exotic jewelry, gems, and shiny things."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/mining, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/smelting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			mask = /obj/item/clothing/mask/rogue/lordmask
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/purple
			belt = /obj/item/storage/belt/rogue/leather/black
			cloak = /obj/item/clothing/cloak/raincloak/purple
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			beltl = /obj/item/flashlight/flare/torch/lantern
			beltr = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/clothing/ring/silver = 2, /obj/item/clothing/ring/gold = 1, /obj/item/rogueweapon/tongs = 1, /obj/item/rogueweapon/hammer = 1, /obj/item/roguegem/yellow = 1, /obj/item/roguegem/green = 1)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)

		if ("Doomsayer")
			to_chat(H, span_warning("THE WORLD IS ENDING!!! At least, that's what you want your clients to believe. You'll offer them a safe place in the new world, of course - built by yours truly."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/masonry, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_APPRENTICE, TRUE)
			head = /obj/item/clothing/head/roguetown/roguehood/black
			mask = /obj/item/clothing/mask/rogue/skullmask
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/black
			belt = /obj/item/storage/belt/rogue/leather/black
			cloak = /obj/item/clothing/cloak/half
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			beltl = /obj/item/flashlight/flare/torch/lantern
			beltr = /obj/item/rogueweapon/stoneaxe/woodcut
			backpack_contents = list(/obj/item/clothing/neck/roguetown/psicross/silver = 3, /obj/item/clothing/neck/roguetown/psicross = 2, /obj/item/clothing/neck/roguetown/psicross/wood = 1, /obj/item/rogueweapon/huntingknife = 1)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 1)

		if ("Scholar")
			to_chat(H, span_warning("You are a scholar traveling the world in order to write a book about your ventures. You trade in stories and tales of your travels."))
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_LEGENDARY, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_EXPERT, TRUE)
			head = /obj/item/clothing/head/roguetown/roguehood/black
			mask = /obj/item/clothing/mask/rogue/spectacles/golden
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/robe/mageyellow
			belt = /obj/item/storage/belt/rogue/leather/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			beltl = /obj/item/flashlight/flare/torch/lantern
			beltr = /obj/item/rogueweapon/huntingknife/idagger
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			backpack_contents = list(/obj/item/paper/scroll = 3, /obj/item/book/rogue/knowledge1 = 1, /obj/item/reagent_containers/glass/bottle/rogue/manapot = 1, /obj/item/reagent_containers/glass/bottle/rogue/strongmanapot = 1, /obj/item/natural/feather = 1, /obj/item/roguegem/amethyst = 1)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 1)
			H.change_stat("speed", 1)
			H.change_stat("endurance", 1)

		if ("Harlequin")
			to_chat(H, span_warning ("You are a travelling entertainer - a jester by trade. Where you go, chaos follows - and mischief is made."))
			shoes = /obj/item/clothing/shoes/roguetown/jester
			pants = /obj/item/clothing/under/roguetown/tights
			armor = /obj/item/clothing/suit/roguetown/shirt/jester
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/rogueweapon/huntingknife/idagger
			beltl = /obj/item/flashlight/flare/torch/lantern
			backl = /obj/item/storage/backpack/rogue/satchel
			head = /obj/item/clothing/head/roguetown/jester
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			H.cmode_music = 'sound/music/combat_jester.ogg'
			backpack_contents = list(/obj/item/smokebomb = 3, /obj/item/storage/pill_bottle/dice = 1, /obj/item/toy/cards/deck = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/music, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, SKILL_LEVEL_APPRENTICE, TRUE)
			ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
			var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Harp")
					backr = /obj/item/rogue/instrument/harp
				if("Lute")
					backr = /obj/item/rogue/instrument/lute
				if("Accordion")
					backr = /obj/item/rogue/instrument/accord
				if("Guitar")
					backr = /obj/item/rogue/instrument/guitar
				if("Hurdy-Gurdy")
					backr = /obj/item/rogue/instrument/hurdygurdy
				if("Viola")
					backr = /obj/item/rogue/instrument/viola
				if("Vocal Talisman")
					backr = /obj/item/rogue/instrument/vocals

/obj/item/clothing/mask/rogue/ragmask/black
	color = CLOTHING_BLACK
