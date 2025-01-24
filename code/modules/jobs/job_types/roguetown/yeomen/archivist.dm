/datum/job/roguetown/archivist
	title = "Archivist"
	tutorial = "The Archivist meticulously preserves and organizes ancient scrolls and tomes, safeguarding the collective knowledge of the realm for generations to come. Nobles and Peasants alike often seek your expertise on matters of history and fact, and your keenly-kept records on the events of this week will likely stand a testament to your Duke's benevolence and their realm's prosperity...or not. After all, you hold the true power: The power to dictate how the future generations will look back on these coming days."
	flag = ARCHIVIST
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	spells = list(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = ALL_AGES_LIST

	outfit = /datum/outfit/job/roguetown/archivist
	display_order = JDO_ARCHIVIST
	give_bank_account = 15
	min_pq = 1 // Please do not read smut while brewing bottle bombs. It upsets the maids when they have to scrape archivists off the ceiling.
	max_pq = null
	round_contrib_points = 3

/datum/outfit/job/roguetown/archivist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		shirt = /obj/item/clothing/suit/roguetown/shirt/robe/archivist
		pants = /obj/item/clothing/under/roguetown/tights/stockings/black
		head  = /obj/item/clothing/head/roguetown/roguehood/black
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/robe/archivist
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		pants = /obj/item/clothing/under/roguetown/tights/black
		head = /obj/item/clothing/head/roguetown/nightman
	backr = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/storage/keyring/archivist
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	mask = /obj/item/clothing/mask/rogue/spectacles
	id = /obj/item/scomstone/bad

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_spellpoints(1)
		H.grant_language(/datum/language/elvish)
		H.grant_language(/datum/language/dwarvish)
		H.grant_language(/datum/language/celestial)
		H.grant_language(/datum/language/hellspeak)
		H.grant_language(/datum/language/orcish)
		H.grant_language(/datum/language/grenzelhoftian)
		H.grant_language(/datum/language/draconic) // All but beast, which is associated with werewolves.
		ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, "[type]")
		ADD_TRAIT(H, TRAIT_INTELLECTUAL, TRAIT_GENERIC)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("intelligence", 4)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/teach)
		if(H.age == AGE_OLD)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 1)


//A spell to teach other characters new skills
/obj/effect/proc_holder/spell/invoked/teach
	name = "The Tutor's Calling"
	overlay_state = "book3"
	releasedrain = 50
	chargedrain = 0
	chargetime = 0
	charge_max = 30 SECONDS
	antimagic_allowed = TRUE

/obj/effect/proc_holder/spell/invoked/teach/cast(list/targets, mob/user = usr)
	. = ..()
	var/list/choices = list()
	var/list/datum/skill/skill_choices = list(
    /datum/skill/misc/reading,
    /datum/skill/misc/lockpicking,
    /datum/skill/misc/riding,
    /datum/skill/misc/music,
    /datum/skill/misc/medicine,
	/datum/skill/misc/sneaking,
	/datum/skill/misc/stealing,
	/datum/skill/misc/climbing,
	/datum/skill/misc/swimming,
    /datum/skill/misc/sewing,
    /datum/skill/labor/farming,
	/datum/skill/labor/butchering,
	/datum/skill/craft/weaponsmithing,
	/datum/skill/craft/armorsmithing,
	/datum/skill/craft/tanning,
	/datum/skill/craft/traps,
	/datum/skill/craft/crafting,
    /datum/skill/craft/blacksmithing,
    /datum/skill/craft/carpentry,
    /datum/skill/craft/masonry,
    /datum/skill/craft/cooking,
    /datum/skill/craft/engineering
    )
	for(var/i = 1, i <= skill_choices.len, i++)
		choices["[skill_choices[i].name]"] = skill_choices[i]

	var/teachingtime = 30 SECONDS

	if(isliving(targets[1]))
		var/mob/living/L = targets[1]
		if(L == usr)
			to_chat(L, span_warning("In teaching myself, I become both the question and the answer."))
			return
		else
			if(L in range(1, usr))
				to_chat(usr, span_notice("My student needs some time to select a lesson."))
				var/chosen_skill = input(L, "Most of the lessons require you to be no less than novice in the selected skill", "Choose a skill") as null|anything in choices
				var/datum/skill/item = choices[chosen_skill]
				if(!item)
					return  // student canceled
				if(alert(L, "Are you sure you want to study [item.name]?", "Learning", "Learn", "Cancel") == "Cancel")
					return
				if(HAS_TRAIT(L, TRAIT_STUDENT))
					to_chat(L, span_warning("There's no way I could handle all that knowledge!"))
					to_chat(usr, span_warning("My student cannot handle that much knowledge at once!"))
					return // cannot teach the same student twice
				if(!(item in list(/datum/skill/misc/music, /datum/skill/craft/cooking, /datum/skill/misc/sewing, /datum/skill/misc/lockpicking, /datum/skill/misc/climbing)) && L.mind?.get_skill_level(item) < SKILL_LEVEL_NOVICE)
					to_chat(L, span_warning("I cannot understand the lesson on [item.name], I need to get more skilled first!"))
					to_chat(usr, span_warning("I try teaching [L] [item.name] but my student couldnt grasp the lesson!"))
					return // some basic skill will not require you novice level
				if(L.mind?.get_skill_level(item) > SKILL_LEVEL_EXPERT)
					to_chat(L, span_warning("There's nothing I can learn from that person about [item.name]!"))
					to_chat(usr, span_warning("They know [item.name] better than I do, am I really supposed to be the teacher there?"))
					return // a student with master or legendary skill have nothing to learn from the scholar
				else
					to_chat(L, span_notice("[usr] starts teaching me about [item.name]!"))
					to_chat(usr, span_notice("[L] gets to listen carefully to my lesson about [item.name]."))
					if(L.mind?.get_skill_level(item) < SKILL_LEVEL_APPRENTICE) // +2 skill levels if novice or no skill
						if(do_after(usr, teachingtime, target = L))
							user.visible_message("<font color='yellow'>[user] teaches [L] a lesson.</font>")
							to_chat(usr, span_notice("My student grows a lot more proficient in [item.name]!"))
							L.mind?.adjust_skillrank(item, 2, FALSE)
							ADD_TRAIT(L, TRAIT_STUDENT, "[type]")
						else
							to_chat(usr, span_warning("[L] got distracted and wandered off!"))
							to_chat(L, span_warning("I must be more focused on my studies!"))
							return	
					else  // +1 skill level if apprentice or better
						if(do_after(usr, teachingtime, target = L))
							user.visible_message("<font color='yellow'>[user] teaches [L] a lesson.</font>")
							to_chat(usr, span_notice("My student grows more proficient in [item.name]!"))
							L.mind?.adjust_skillrank(item, 1, FALSE)
							ADD_TRAIT(L, TRAIT_STUDENT, "[type]")
						else
							to_chat(usr, span_warning("[L] got distracted and wandered off!"))
							to_chat(L, span_warning("I must be more focused on my studies!"))
							return	
			else
				to_chat(usr, span_warning("My student can barely hear me from there."))
				return
	else
		revert_cast()
		return FALSE
