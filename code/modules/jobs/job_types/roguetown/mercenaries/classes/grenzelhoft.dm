/datum/advclass/mercenary/grenzelhoft
	name = "Grenzelhoft"
	tutorial = "Experts, Professionals, Expensive. Those are the first words that come to mind when the emperiate Grenzelhoft mercenary guild is mentioned. While you may work for coin like any common sellsword, maintaining the prestige of the guild will be of utmost priority."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'
	classes = list("Doppelsoldner" = "You are a Doppelsoldner of Grenzelhoft, a swordsman experienced with long-length blades.",
					"Halberdier" = "You are a Halberdier from Grenzelhoft, a skilled user of poleamrs and axes. Though you prefer them combined.")

/datum/outfit/job/roguetown/mercenary/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Doppelsoldner","Halberdier")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Doppelsoldner")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Doppelsoldner of Grenzelhoft, a swordsman experienced with long-length blades."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_NOVICE, TRUE)	//Won't be using normally with Zwiehander but useful.
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)		//Trust me, they'll need it due to stamina drain on their base-sword.
			H.change_stat("strength", 2)	//Should give minimum required stats to use Zweihander
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 3)
			H.change_stat("perception", 1)
			H.change_stat("speed", -1)		//They get heavy armor now + sword option; so lower speed.
			r_hand = /obj/item/rogueweapon/greatsword/grenz
		if("Halberdier")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Halberdier from Grenzelhoft, a skilled user of poleamrs and axes. Though you prefer them combined."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.change_stat("strength", 2) //same str, worse end, more speed - actually a good tradeoff, now.
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("perception", -1)
			H.change_stat("speed", 1)
			r_hand = /obj/item/rogueweapon/halberd

	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate
	pants = /obj/item/clothing/under/roguetown/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/grenzelgloves
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/gwstrap

	backpack_contents = list(/obj/item/roguekey/mercenary)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.grant_language(/datum/language/grenzelhoftian)
