/datum/advclass/mercenary/warscholar
	name = "Naledi Warscholar"
	tutorial = "Heralded by sigils of black-and-gold and their distinct masks, the Naledi Warscholars once prowled the dunes of their homeland, exterminating daemons in exchange for coin, artifacts, or knowledge. As Naledi's economy falters, the Warscholars travel to foreign lands to seek further business."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/warscholar
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/warscholar.ogg'
	traits_applied = list(TRAIT_OUTLANDER)
	classes = list("Hierophant" = "You are a Naledi Hierophant, a magician who studied under cloistered sages, well-versed in all manners of arcyne. You prioritize enhancing your teammates and distracting foes while staying in the backline.",
					"Pontifex" = "You are a Naledi Pontifex, a scout and spy trained into a hybridized style of movement-controlling shadow magic and hand-to-hand combat. Though your abilities in magical fields are lacking, you are more than equipped to defend yourself should the dark fail to keep you safe.",
					"Vizier" = "You are a Naledi Vizier. Your research into miracles and holy incantations has lead you to esoteric magycks. Though psydonians have long struggled to channel their all-father's divinity, a combination of the saint's power may be similar enough.")

/datum/outfit/job/roguetown/mercenary/warscholar
	var/detailcolor
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/mercenary/warscholar/pre_equip(mob/living/carbon/human/H)
	..()
	var/list/naledicolors = sortList(list(
		"GOLD" = "#C8BE6D",
		"PALE PURPLE" = "#9E93FF",
		"BLUE" = "#A7B4F6",
		"BRICK BROWN" = "#773626",
		"PURPLE" = "#B542AC",
		"GREEN" = "#62a85f",
		"BLUE" = "#A9BFE0",
		"RED" = "#ED6762",
		"ORANGE" = "#EDAF6D",
		"PINK" = "#EDC1D5",
		"MAROON" = "#5F1F34",
		"BLACK" = "#242526"
	))
	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	detailcolor = input("Choose a color.", "NALEDIAN COLORPLEX") as anything in naledicolors
	detailcolor = naledicolors[detailcolor]
	var/classes = list("Hierophant","Pontifex","Vizier")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	mask = /obj/item/clothing/mask/rogue/lordmask/naledi
	wrists = /obj/item/clothing/neck/roguetown/psicross/naledi
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	backr = /obj/item/storage/backpack/rogue/satchel/black

	switch(classchoice)

		if("Hierophant")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Naledi Hierophant, a magician who studied under cloistered sages, well-versed in all manners of arcyne. You prioritize enhancing your teammates and distracting foes while staying in the backline."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.grant_language(/datum/language/celestial)
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
				H.change_stat("speed", -1)
				H.change_stat("intelligence", 1)
				H.change_stat("perception", 1)
				H.mind.adjust_spellpoints(1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)
			H.change_stat("constitution", -1)
			H.change_stat("perception", 1)
			H.change_stat("intelligence", 3)
			H.mind.adjust_spellpoints(2)
			ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			r_hand = /obj/item/rogueweapon/woodstaff/naledi


			head = /obj/item/clothing/head/roguetown/roguehood/hierophant
			cloak = /obj/item/clothing/cloak/hierophant
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/hierophant
			shirt = /obj/item/clothing/suit/roguetown/shirt/robe/hierophant
			pants = /obj/item/clothing/under/roguetown/trou/leather
			backpack_contents = list(/obj/item/roguekey/mercenary,/obj/item/rogueweapon/huntingknife,/obj/item/spellbook_unfinished/pre_arcyne)

		if("Pontifex")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Naledi Pontifex, a scout and spy trained into a hybridized style of movement-controlling shadow magic and hand-to-hand combat. Though your abilities in magical fields are lacking, you are more than equipped to defend yourself should the dark fail to keep you safe."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_spellpoints(-6) //The - is intended.
			H.change_stat("strength", 3)
			H.change_stat("constitution", -1)
			H.change_stat("endurance", 1)
			H.change_stat("perception", -1)
			H.change_stat("speed", 2)
			H.grant_language(/datum/language/celestial)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch) // In an attempt to make them less Possibly Wildly OP, they can't freely pick their spells. Casts at apprentice level, but doesn't get the spellbuy points it'd provide.
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
			H.mind.AddSpell(new/obj/effect/proc_holder/spell/invoked/projectile/repel)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/shadowstep)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

			head = /obj/item/clothing/head/roguetown/roguehood/pontifex
			gloves = /obj/item/clothing/gloves/roguetown/angle/pontifex
			head = /obj/item/clothing/head/roguetown/roguehood/pontifex
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/pontifex
			shirt = /obj/item/clothing/suit/roguetown/shirt/robe/pointfex
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex
			backpack_contents = list(/obj/item/roguekey/mercenary,/obj/item/lockpick = 1,/obj/item/rogueweapon/huntingknife)

		if("Vizier")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Naledi Vizier. Your research into miracles and holy incantations has lead you to esoteric magycks. Though psydonians have long struggled to channel their all-father's divinity, a combination of the saint's power may be similar enough."))
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, SKILL_LEVEL_NOVICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_JOURNEYMAN, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_EXPERT, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_EXPERT, TRUE)
			H.change_stat("endurance", 2)
			H.change_stat("intelligence", 3)
			H.change_stat("speed", 2)
			r_hand = /obj/item/rogueweapon/woodstaff/naledi
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/magered

			mask = /obj/item/clothing/mask/rogue/lordmask/tarnished
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/angle
			backr = /obj/item/storage/backpack/rogue/satchel/black
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/black
			cloak = /obj/item/clothing/cloak/half
			H.grant_language(/datum/language/celestial)
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord

			backpack_contents = list(/obj/item/roguekey/mercenary,/obj/item/rogueweapon/huntingknife)
			
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_monk(H)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
			H.mind.RemoveSpell(/obj/effect/proc_holder/spell/invoked/lesser_heal)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/regression)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/convergence)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/stasis)



/datum/outfit/job/roguetown/mercenary/warscholar/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	for(var/obj/item/clothing/V in H.get_equipped_items(FALSE))
		if(V.naledicolor)
			V.color = detailcolor
			V.update_icon()
	H.regenerate_icons()
