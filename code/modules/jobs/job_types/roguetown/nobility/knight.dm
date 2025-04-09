/datum/job/roguetown/knight
	title = "Knight" //Back to proper knights.
	flag = KNIGHT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_races = RACES_NO_CONSTRUCT
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Having proven yourself both loyal and capable, you have been knighted to serve the realm as the royal family's sentry. You listen to your Liege and the Knight Captain, defending your Lord and realm - the last beacon of chivalry in these dark times."
	display_order = JDO_KNIGHT
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/knight
	advclass_cat_rolls = list(CTAG_ROYALGUARD = 20)

	give_bank_account = 22
	noble_income = 10
	min_pq = 8
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_knight.ogg'

/datum/job/roguetown/knight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight's tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Ser"
		if(should_wear_femme_clothes(H))
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/knight
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	neck = /obj/item/clothing/neck/roguetown/bevor
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
	id = /obj/item/scomstone/bad/garrison
	backpack_contents = list(/obj/item/storage/keyring/guardcastle = 1)

/datum/outfit/job/roguetown/knight/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)	
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNIGHTSMAN, TRAIT_GENERIC) 
	ADD_TRAIT(H, TRAIT_GOODTRAINER, TRAIT_GENERIC)

/datum/advclass/knight/heavy
	name = "Heavy Knight"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with massive swords, axes, maces, and polearms. People may fear the mounted knights, but they should truly fear those who come off their mount..."
	outfit = /datum/outfit/job/roguetown/knight/heavy

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/heavy/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE) //Polearms are pretty much explicitly a two-handed weapon, so I gave them a polearm option.
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_NOVICE, TRUE)	//Too heavy for horses.
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, SKILL_LEVEL_APPRENTICE, TRUE)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()	
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) //Heavy hitters. Less con/end, high strength.
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Zweihander","Great Mace","Battle Axe","Estoc","Lucerne")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Zweihander")
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			backl = /obj/item/gwstrap
		if("Great Mace")
			r_hand = /obj/item/rogueweapon/mace/goden/steel
		if("Battle Axe")
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
		if("Estoc")
			r_hand = /obj/item/rogueweapon/estoc
			backl = /obj/item/gwstrap
		if("Lucerne")
			r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
			backl = /obj/item/gwstrap

	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1)

/datum/advclass/knight/footknight
	name = "Foot Knight"
	tutorial = "You are accustomed to traditional foot-soldier training in one-handed weapons such as flails, swords, and maces. Your fortitude and mastery with the versatile combination of a shield and weapon makes you a fearsome opponent to take down!"
	outfit = /datum/outfit/job/roguetown/knight/footknight

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/footknight/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_APPRENTICE, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, SKILL_LEVEL_APPRENTICE, TRUE)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.change_stat("strength", 1) //Tanky, less strength, but high con/end.
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Bastard Sword","Flail","Warhammer")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Bastard Sword")
			beltr = /obj/item/rogueweapon/sword/long
		if("Flail")
			beltr = /obj/item/rogueweapon/flail/sflail
		if ("Warhamer")
			beltr = /obj/item/rogueweapon/mace/warhammer //Iron warhammer. This is one-handed and pairs well with shields. They can upgrade to steel in-round.
	
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	backl = /obj/item/rogueweapon/shield/tower/metal

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1)

/datum/advclass/knight/mountedknight
	name = "Mounted Knight"
	tutorial = "You are the picture-perfect knight from a high tale, knowledgeable in riding steeds into battle. You specialize in weapons most useful on a saiga including spears, swords, maces, and a variety of ranged weaponry."
	outfit = /datum/outfit/job/roguetown/knight/mountedknight
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/saigabuck/tame/saddled

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/mountedknight/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, SKILL_LEVEL_JOURNEYMAN, TRUE)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.change_stat("strength", 2) //Decent all-around stats. Nothing spectacular. Ranged/melee hybrid class on horseback.
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 2)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Bastard Sword + Crossbow","Billhook + Recurve Bow","Grand Mace + Longbow")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Bastard Sword + Crossbow")
			beltl = /obj/item/rogueweapon/sword/long
			beltr = /obj/item/quiver/bolts
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
		if("Billhook + Recurve Bow")
			r_hand = /obj/item/rogueweapon/spear/billhook
			backl = /obj/item/gwstrap
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
		if("Grand Mace + Longbow")
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/rogueweapon/mace/goden/steel

	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1)


/datum/advclass/knight/irregularknight
	name = "Royal Champion"
	tutorial = "Your skillset is abnormal for a knight. Your swift maneuvers and masterful technique impress both lords and ladies alike, and you have a preference for quicker, more elegant blades. While you are an effective fighting force in medium armor, your evasive skills will only truly shine if you don even lighter protection."
	outfit = /datum/outfit/job/roguetown/knight/irregularknight

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/irregularknight/pre_equip(mob/living/carbon/human/H)
	..()	
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE) //Swords and knives class.
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE) //Whips can work as a light class weapon.	
	H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_APPRENTICE, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_EXPERT, TRUE) //Bows fit a light/speedy class pretty well, gave them ranged options.
	H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_EXPERT, TRUE)		
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, SKILL_LEVEL_APPRENTICE, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Rapier + Longbow","Estoc + Recurve Bow","Sabre + Buckler","Whip + Crossbow")
	var/armor_options = list("Light Armor", "Medium Armor")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	var/armor_choice = input("Choose your armor.", "TAKE UP ARMS") as anything in armor_options
	H.set_blindness(0)
	switch(weapon_choice)
		if("Rapier + Longbow") 
			beltl = /obj/item/rogueweapon/sword/rapier
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
			beltr = /obj/item/quiver/arrows

		if("Estoc + Recurve Bow")
			r_hand = /obj/item/rogueweapon/estoc
			backl = /obj/item/gwstrap
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
		
		if("Sabre + Buckler")
			beltl = /obj/item/rogueweapon/sword/sabre
			backl = /obj/item/rogueweapon/shield/buckler

		if("Whip + Crossbow")
			beltl = /obj/item/rogueweapon/whip
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			beltr = /obj/item/quiver/bolts

	switch(armor_choice)
		if("Light Armor")
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
		if("Medium Armor")
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			pants = /obj/item/clothing/under/roguetown/chainlegs
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light

	var/helmets = list(
		"Pigface Bascinet" 		= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Bascinet"				= /obj/item/clothing/head/roguetown/helmet/bascinet,
		"Sallet"				= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Visored Sallet"		= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Hounskull Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"None"
	)
	
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1)
