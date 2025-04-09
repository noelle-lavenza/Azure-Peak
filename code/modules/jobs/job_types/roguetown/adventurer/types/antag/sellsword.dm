/datum/advclass/sellsword //Strength class, starts with axe or flails and medium armor training
	name = "Sellsword"
	tutorial = "Perhaps a mercenary, perhaps a deserter - at one time, you killed for a master in return for gold. Now you live with no such master over your head - and take what you please."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/sellsword
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit2.ogg'

/datum/outfit/job/roguetown/bandit/sellsword/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_NOVICE, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	id = /obj/item/mattcoin
	H.change_stat("strength", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 2)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.adjust_blindness(-3)
	var/weapons = list("Spear & Crossbow","Sword & Buckler")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Spear & Crossbow") //Deserter watchman. Maybe should be shield and spear? spear and crossbow is kinda clumsy
			backl= /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow //we really need to make this not a grenade launcher subtype
			beltr = /obj/item/quiver/bolts
			r_hand = /obj/item/rogueweapon/spear/billhook
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if("Sword & Buckler") //Mercenary on the wrong side of the law
			backl= /obj/item/rogueweapon/shield/buckler
			beltr = /obj/item/rogueweapon/sword //steel sword like literally every adventurer gets
			head = /obj/item/clothing/head/roguetown/helmet/sallet
