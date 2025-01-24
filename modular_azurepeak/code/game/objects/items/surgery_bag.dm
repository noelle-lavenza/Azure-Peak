/obj/item/storage/belt/rogue/surgery_bag
	name = "surgeon's bag"
	desc = "Made to hold everything a people-butcher will need. Contains a list of implements... what even IS a Sisrat?"
	icon = 'icons/roguetown/clothing/storage.dmi'
	mob_overlay_icon = null
	icon_state = "surgery_bag"
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	component_type = /datum/component/storage/concrete/roguetown/surgery_bag
	populate_contents = list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat/first,
		/obj/item/rogueweapon/surgery/hemostat/second, //Different types, for the purpose of belt overlays.
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/needle
	)

/obj/item/storage/belt/rogue/surgery_bag/full/physician
	populate_contents = list(
	/obj/item/rogueweapon/surgery/scalpel,
	/obj/item/rogueweapon/surgery/saw,
	/obj/item/rogueweapon/surgery/hemostat/first,
	/obj/item/rogueweapon/surgery/hemostat/second,
	/obj/item/rogueweapon/surgery/retractor,
	/obj/item/rogueweapon/surgery/bonesetter,
	/obj/item/rogueweapon/surgery/cautery,
	/obj/item/needle/pestra //Gets the special needle!
	)
