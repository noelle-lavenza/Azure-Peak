/obj/item/clothing/suit/roguetown/shirt/robe
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK|ITEM_SLOT_SHIRT
	name = "robe"
	desc = ""
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "white_robe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH
	color = "#7c6d5c"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	genitalaccess = TRUE
	is_bra = TRUE //so it lets bottom access.

/obj/item/clothing/suit/roguetown/shirt/robe/monk
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "monk robe"
	desc = "Humble robes worn by monks in service to the gods."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "monkrobes"
	item_state = "monkrobes"
	sleeved = null
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/astrata
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "sun robe"
	desc = "Robes worn by those in service to the sun."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "astratarobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/noc
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "moon robe"
	desc = "Robes worn by those in service to the moon."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "nocrobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/necromancer
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "necromancer robes"
	desc = "Often worn by those who practice in the field of necromancy."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "necromrobe"
	icon = 'modular_stonehedge/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/dendor
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "briar robe"
	desc = "Robes worn by Druid's in service to nature."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "dendorrobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/necra
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "mourning robe"
	desc = "Black robes which cover the body not unlike those in depictions of the tollcollector."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "necrarobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	boobed = TRUE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/psydonrobe
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "red robes"
	desc = "Red like blood.."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "psydonrobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	boobed = FALSE
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/black
	color = null

/obj/item/clothing/suit/roguetown/shirt/robe/white
	color = null

/obj/item/clothing/suit/roguetown/shirt/robe/priest
	name = "solar vestments"
	desc = "Holy vestments sanctified by divine hands. Caution is advised if not a faithful."
	icon_state = "priestrobe"
	color = null

/obj/item/clothing/suit/roguetown/shirt/robe/priest/pickup(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_CHOSEN))
		to_chat(user, "<font color='yellow'>UNWORTHY HANDS TOUCH THE VESTMENTS, CEASE OR BE PUNISHED</font>")
		spawn(30)
			if(loc == user)
				user.adjust_fire_stacks(5)
				user.IgniteMob()
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/courtmage
	color = "#6c6c6c"

/obj/item/clothing/suit/roguetown/shirt/robe/mage/Initialize()
	color = pick("#4756d8", "#759259", "#bf6f39", "#c1b144", "#b8252c")
	. = ..()

/obj/item/clothing/suit/roguetown/shirt/robe/mageblue
	color = "#4756d8"

/obj/item/clothing/suit/roguetown/shirt/robe/magegreen
	color = "#759259"

/obj/item/clothing/suit/roguetown/shirt/robe/mageorange
	color = "#bf6f39"

/obj/item/clothing/suit/roguetown/shirt/robe/magered
	color = "#b8252c"

/obj/item/clothing/suit/roguetown/shirt/robe/mageyellow
	color = "#c1b144"

/obj/item/clothing/suit/roguetown/shirt/robe/abyssoracorobe
	name = "abyssor robe"
	desc = "A fancy jacket common with merchants."
	icon_state = "abyssorrobe"
	color = null

/obj/item/clothing/suit/roguetown/shirt/robe/nun
	color = null
	icon_state = "nun"
	item_state = "nun"
	allowed_sex = list(MALE, FEMALE)

/obj/item/clothing/suit/roguetown/shirt/robe/wizard
	name = "wizard's robe"
	desc = "What wizard's ensemble would be complete without robes?"
	icon_state = "wizardrobes"
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/shirts.dmi'
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/suit/roguetown/shirt/robe/physician
	name = "plague coat"
	desc = "Medicum morbo adhibere."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "physcoat"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	sleeved = null
	boobed = TRUE
	color = null
	flags_inv = HIDEBOOB|HIDETAIL|HIDEBUTT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

//Eora content from Stonekeep

/obj/item/clothing/suit/roguetown/shirt/robe/eora
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "eoran robe"
	desc = "Holy robes, intended for use by followers of love."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "eorarobes"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	boobed = TRUE
	color = null
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	var/fanatic_wear = FALSE

/obj/item/clothing/suit/roguetown/shirt/robe/eora/alt
	name = "open courtesan robe"
	desc = "Used by more radical followers of the loving."
	body_parts_covered = null
	icon_state = "eorastraps"
	fanatic_wear = TRUE

/obj/item/clothing/suit/roguetown/shirt/robe/eora/attack_right(mob/user)
	switch(fanatic_wear)
		if(FALSE)
			name = "open courtesan robe"
			desc = "Used by more radical followers of the lovers domain."
			body_parts_covered = null
			icon_state = "eorastraps"
			fanatic_wear = TRUE
			to_chat(usr, span_warning("Now wearing radically!"))
		if(TRUE)
			name = "eoran robe"
			desc = "Holy robes, intended for use by followers of love."
			body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
			icon_state = "eorarobes"
			fanatic_wear = FALSE
			to_chat(usr, span_warning("Now wearing normally!"))
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_armor()

/obj/item/clothing/suit/roguetown/shirt/robe/spellcasterrobe
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "spellcaster robes"
	desc = "Robes worn by journeyman wizards"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "spellcasterrobe"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/vamprobe
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	name = "dark robes"
	desc = "Dark robes usually worn by those with bad intentions."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "vamp"
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = null
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/feldrobe
	name = "feldrobe"
	desc = "Long robes which cover the body, but lack sleeves."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "feldrobe"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK|ITEM_SLOT_SHIRT
	sleeved = null
	boobed = TRUE
	color = null
	flags_inv = HIDEBOOB|HIDETAIL|HIDECROTCH|HIDEBUTT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
	name = "surgrobe"
	desc = "Long robes which cover the body, but lack sleeves."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "surgrobe"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK|ITEM_SLOT_SHIRT
	sleeved = null
	boobed = TRUE
	color = null
	flags_inv = HIDEBOOB|HIDETAIL|HIDECROTCH|HIDEBUTT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/robe/judge
	name = "judge coat"
	desc = "A thick coat, somewhat comfortable."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "judgecoat"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	sleeved = null
	boobed = TRUE
	color = null
	flags_inv = HIDEBOOB|HIDETAIL|HIDEBUTT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
