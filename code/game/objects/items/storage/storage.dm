/obj/item/storage
	name = "storage"
	w_class = WEIGHT_CLASS_NORMAL
	var/rummage_if_nodrop = TRUE
	var/component_type = /datum/component/storage/concrete
	var/list/populate_contents = list()
	obj_flags = CAN_BE_HIT

/obj/item/storage/get_dumping_location(obj/item/storage/source,mob/user)
	return src

/obj/item/storage/Initialize()
	. = ..()
	PopulateContents()

/obj/item/storage/ComponentInitialize()
	AddComponent(component_type)

/obj/item/storage/AllowDrop()
	return FALSE

/obj/item/storage/contents_explosion(severity, target)
	for(var/atom/A in contents)
		A.ex_act(severity, target)
		CHECK_TICK

/obj/item/storage/canStrip(mob/who)
	. = ..()
	if(!. && rummage_if_nodrop)
		return TRUE

/obj/item/storage/doStrip(mob/who)
	if(HAS_TRAIT(src, TRAIT_NODROP) && rummage_if_nodrop)
		var/datum/component/storage/CP = GetComponent(/datum/component/storage)
		CP.do_quick_empty()
		return TRUE
	return ..()

/obj/item/storage/contents_explosion(severity, target)
//Cyberboss says: "USE THIS TO FILL IT, NOT INITIALIZE OR NEW"

/obj/item/storage/proc/PopulateContents()
	for(var/path in populate_contents)
		var/obj/item/new_item = new path(loc)
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, new_item, null, TRUE, TRUE))
			new_item.inventory_flip(null, TRUE)
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, new_item, null, TRUE, TRUE))
				testing("Deleting:[new_item] from [src]")
				qdel(new_item)

/obj/item/storage/proc/emptyStorage()
	var/datum/component/storage/ST = GetComponent(/datum/component/storage)
	if(ST)
		ST.do_quick_empty()

/obj/item/storage/can_craft_with()
	if(contents.len)
		return FALSE
	return ..()
