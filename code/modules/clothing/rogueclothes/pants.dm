/obj/item/clothing/under/roguetown
	slot_flags = ITEM_SLOT_PANTS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
	body_parts_covered = GROIN|LEGS
	icon = 'icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/pants.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	sleevetype = "leg"
	equip_delay_self = 30
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	r_sleeve_zone = BODY_ZONE_R_LEG
	l_sleeve_zone = BODY_ZONE_L_LEG
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/under/roguetown/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_pants()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_pants()
	return

/obj/item/clothing/under/roguetown/tights
	name = "tights"
	desc = "A pair of form fitting tights."
	gender = PLURAL
	icon_state = "tights"
	item_state = "tights"
//	adjustable = CAN_CADJUST

/obj/item/clothing/under/roguetown/tights/random/Initialize()
	color = pick("#544236", "#435436", "#543836", "#79763f")
	..()

/obj/item/clothing/under/roguetown/tights/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/tights/red
	color = CLOTHING_RED

/obj/item/clothing/under/roguetown/tights/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/under/roguetown/tights/jester
	desc = "Funny tights!"
	color = "#1E3B20"

/obj/item/clothing/under/roguetown/tights/lord
	color = "#865c9c"

/obj/item/clothing/under/roguetown/tights/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_LEFT

/obj/item/clothing/under/roguetown/tights/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_RIGHT

/obj/item/clothing/under/roguetown/tights/vagrant/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/under/roguetown/tights/sailor
	name = "pants"
	icon_state = "sailorpants"

/obj/item/clothing/under/roguetown/webs
	name = "webbing"
	desc = "a fine webbing made from spidersilk, popular fashion within the underdark"
	gender = PLURAL
	icon_state = "webs"
	item_state = "webs"
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/trou
	name = "work trousers"
	desc = "Good quality trousers worn by laborers."
	gender = PLURAL
	icon_state = "trou"
	item_state = "trou"
//	adjustable = CAN_CADJUST
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	can_hold_endowed = TRUE

/obj/item/clothing/under/roguetown/trou/leather
	name = "leather trousers"
	desc = "Trousers made of fine leather."
	icon_state = "leathertrou"

/obj/item/clothing/under/roguetown/trou/skirt
	name = "leather skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	desc = "Short skirt made of fine leather."
	icon_state = "leatherskirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/chainlegs/iron/studdedskirt
	name = "studded skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	//slightly better than normal iron chain by 10 blunt and stab.
	armor = list("blunt" = 50, "slash" = 80, "stab" = 50, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "Short studded skirt made of fine leather and iron."
	icon_state = "studdedskirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/trou/plainpants
	name = "plain pants"
	desc = "Some plain pants, not much else to them."
	icon_state = "plainpants"
	item_state = "plainpants"

/obj/item/clothing/under/roguetown/trou/stripedpants
	name = "striped pants"
	desc = "Some blue pants with white stripes."
	icon_state = "stripedpants"
	item_state = "stripedpants"

/obj/item/clothing/under/roguetown/trou/narvalipantsred
	name = "highland pants"
	desc = "Pants worn by clanmen in the Narvali Highlands."
	icon_state = "narvali_red"
	item_state = "narvali_red"

/obj/item/clothing/under/roguetown/trou/narvalipantsblue
	name = "highland pants"
	desc = "Pants worn by clanmen in the Narvali Highlands."
	icon_state = "narvali_blue"
	item_state = "narvali_blue"

/obj/item/clothing/under/roguetown/trou/narvalipantsgreen
	name = "highland pants"
	desc = "Pants worn by clanmen in the Narvali Highlands."
	icon_state = "narvali_green"
	item_state = "narvali_green"

/obj/item/clothing/under/roguetown/trou/leather/mourning
	name = "mourning trousers"
	desc = "Dark trousers worn by morticians while performing burial rites."
	icon_state = "leathertrou"
	color = "#151615"

/obj/item/clothing/under/roguetown/chainlegs
	name = "steel chain chausses"
	desc = "Chain leggings composed of interlinked metal rings."
	gender = PLURAL
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "chain_legs"
	item_state = "chain_legs"
//	adjustable = CAN_CADJUST
	sewrepair = FALSE
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = CHAINHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	can_hold_endowed = TRUE

/obj/item/clothing/under/roguetown/brayette
	name = "brayette"
	desc = "Chain underwear which protect the family jewels."
	gender = PLURAL
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "chain_bootyshorts"
	item_state = "chain_bootyshorts"
	max_integrity = 325
	sewrepair = FALSE
	armor = list("blunt" = 70, "slash" = 100, "stab" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	body_parts_covered = GROIN
	blocksound = CHAINHIT
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	w_class = WEIGHT_CLASS_SMALL
	clothing_flags = CANT_SLEEP_IN
	resistance_flags = FIRE_PROOF

/obj/item/clothing/under/roguetown/chainlegs/iron

	name = "iron chain chausses"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "chain_legs"
	color = "#9EA48E"
	armor = list("blunt" = 40, "slash" = 80, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/under/roguetown/platelegs
	name = "plated chausses"
	desc = "Plated armor to protect the legs."
	gender = PLURAL
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "plate_legs"
	item_state = "plate_legs"
//	adjustable = CAN_CADJUST
	sewrepair = FALSE
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN
	resistance_flags = FIRE_PROOF

/obj/item/clothing/under/roguetown/heavyroyalplatelegs
	name = "royal heavyplated chausses"
	desc = "Plated armor to protect the legs."
	gender = PLURAL
	icon_state = "royalplate_pants"
	item_state = "royalplate_pants"
//	adjustable = CAN_CADJUST
	sewrepair = FALSE
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/carapacelegs
	name = "carapace chausses"
	desc = "Aquatic plated armor to protect the legs."
	gender = PLURAL
	icon_state = "carapace_legs"
	item_state = "carapace_legs"
	smeltresult = /obj/item/ash
	sewrepair = TRUE
	anvilrepair = null
	armor = list("blunt" = 60, "slash" = 100, "stab" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/chainlegs/iron/skirt
	name = "iron chain skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "chain_skirt"
	item_state = "chain_skirt"
	color = "#9EA48E"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/chainlegs/skirt
	name = "chain skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "chain_skirt"
	item_state = "chain_skirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/platelegs/skirt
	name = "plated skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "plate_skirt"
	item_state = "plate_skirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/carapacelegs/skirt
	name = "carapace plated skirt"
	icon_state = "carapace_skirt"
	item_state = "carapace_skirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/carapacelegs/dragon
	name = "dragonscale platelegs"
	desc = "Dragonscale armor to protect the legs."
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)
	color = "#9e5761"
	sellprice = 50

/obj/item/clothing/under/roguetown/carapacelegs/dragon/skirt
	name = "dragonscale plated skirt"
	icon_state = "carapace_skirt"
	item_state = "carapace_skirt"
	sellprice = 50
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/loincloth
	name = "loincloth"
	desc = "Covers your dignity, but only just."
	icon_state = "loincloth"
	item_state = "loincloth"
//	adjustable = CAN_CADJUST
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/loincloth/brown
	color = CLOTHING_BROWN


/obj/item/clothing/under/roguetown/loincloth/pink
	color = "#b98ae3"

/obj/item/clothing/under/roguetown/grenzelpants
	name = "grenzelhoftian paumpers"
	desc = "Padded pants for extra comfort and protection, adorned in vibrant colors."
	icon_state = "grenzelpants"
	item_state = "grenzelpants"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	detail_tag = "_detail"
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT)
	var/picked = FALSE

/obj/item/clothing/under/roguetown/grenzelpants/attack_right(mob/user)
	..()
	if(!picked)
		var/list/colors = list(
		"Swan White"="#ffffff",
		"Lavender"="#865c9c",
		"Royal Purple"="#5E4687",
		"Wine Rouge"="#752B55",
		"Sow's skin"="#CE929F",
		"Knight's Red"="#933030",
		"Madroot Red"="#AD4545",
		"Marigold Orange"="#E2A844",
		"Politely, Yuck"="#685542",
		"Astrata's Yellow"="#FFFD8D",
		"Bog Green"="#375B48",
		"Seafoam Green"="#49938B",
		"Woad Blue"="#395480",
		"Cornflower Blue"="#749EE8",
		"Blacksteel Grey"="#404040",)

		var/choice = input(user, "Choose a color.", "Grenzelhoft colors") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_pants()

/obj/item/clothing/under/roguetown/grenzelpants/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/under/roguetown/grenzknightpants
	name = "grenzelhoft knight bottoms"
	desc = "Padded pants worn by Grenzelhoftian knights."
	icon_state = "grenzknight_pants"
	item_state = "grenzknight_pants"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	detail_tag = "_detail"
	flags_inv = HIDECROTCH
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT)
	var/picked = FALSE

/obj/item/clothing/under/roguetown/grenzknightpants/attack_right(mob/user)
	..()
	if(!picked)
		var/list/colors = list(
		"Swan White"="#ffffff",
		"Lavender"="#865c9c",
		"Royal Purple"="#5E4687",
		"Wine Rouge"="#752B55",
		"Sow's skin"="#CE929F",
		"Knight's Red"="#933030",
		"Madroot Red"="#AD4545",
		"Marigold Orange"="#E2A844",
		"Politely, Yuck"="#685542",
		"Astrata's Yellow"="#FFFD8D",
		"Bog Green"="#375B48",
		"Seafoam Green"="#49938B",
		"Woad Blue"="#395480",
		"Cornflower Blue"="#749EE8",
		"Blacksteel Grey"="#404040",)

		var/choice = input(user, "Choose a color.", "Grenzelhoft colors") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_pants()

/obj/item/clothing/under/roguetown/grenzknightpants/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)
