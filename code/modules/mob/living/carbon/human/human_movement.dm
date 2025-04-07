/mob/living/carbon/human/get_movespeed_modifiers()
	var/list/considering = ..()
	. = considering
	if(HAS_TRAIT(src, TRAIT_IGNORESLOWDOWN))
		for(var/id in .)
			var/list/data = .[id]
			if(data[MOVESPEED_DATA_INDEX_FLAGS] & IGNORE_NOSLOW)
				.[id] = data

/mob/living/carbon/human/slip(knockdown_amount, obj/O, lube, paralyze, forcedrop)
	if(HAS_TRAIT(src, TRAIT_NOSLIPALL))
		return 0
	if (!(lube&GALOSHES_DONT_HELP))
		if(HAS_TRAIT(src, TRAIT_NOSLIPWATER))
			return 0
		if(shoes && istype(shoes, /obj/item/clothing))
			var/obj/item/clothing/CS = shoes
			if (CS.clothing_flags & NOSLIP)
				return 0
	return ..()

/mob/living/carbon/human/mob_has_gravity()
	. = ..()
	if(!.)
		if(mob_negates_gravity())
			. = 1

/mob/living/carbon/human/mob_negates_gravity()
	return ((shoes && shoes.negates_gravity()) || (dna.species.negates_gravity(src)))

/mob/living/carbon/human/Move(NewLoc, direct)
/*	if(fixedeye || tempfixeye)
		switch(dir)
			if(NORTH)
				if(direct == WEST|EAST)
					OffBalance(30)
			if(SOUTH)
				if(direct == WEST|EAST)
					OffBalance(30)
			if(EAST)
				if(direct == NORTH|SOUTH)
					OffBalance(30)
			if(WEST)
				if(direct == NORTH|SOUTH)
					OffBalance(30)*/

	. = ..()
	if(loc == NewLoc)
		if(!has_gravity(loc))
			return

		if(hostage) // If we have a hostage.
			hostage.hostagetaker = null
			hostage = null
			to_chat(src, "<span class='danger'>I need to stand still to make sure I don't lose concentration on my hostage!</span>")

		if(hostagetaker) // If we are TAKEN hostage. Confusing vars at first but then it makes sense.
			attackhostage()

		if(mobility_flags & MOBILITY_STAND)
			if(istype(wear_armor, /obj/item/clothing))
				var/obj/item/clothing/C = wear_armor
				C.step_action()
			if(istype(wear_shirt, /obj/item/clothing))
				var/obj/item/clothing/C = wear_shirt
				C.step_action()
			if(istype(cloak, /obj/item/clothing))
				var/obj/item/clothing/C = cloak
				C.step_action()
			if(istype(shoes, /obj/item/clothing))
				var/obj/item/clothing/C = shoes
				C.step_action()
		if(mouth)
		
			if(mouth.spitoutmouth && prob(5))
				visible_message(span_warning("[src] spits out [mouth]."))
				dropItemToGround(mouth, silent = FALSE)
			if(src.mind?.has_antag_datum(/datum/antagonist/zombie) && (!src.handcuffed) && prob(50))
				visible_message(span_warning("[src] spits out [mouth]."))
				dropItemToGround(mouth, silent = FALSE)
		if(held_items.len)
			for(var/obj/item/I in held_items)
				if(I.minstr)
					var/effective = I.minstr
					if(I.wielded)
						effective = max(I.minstr / 2, 1)
					if(effective > STASTR)
						if(prob(effective))
							dropItemToGround(I, silent = FALSE)

/mob/living/carbon/human/Process_Spacemove(movement_dir = 0) //Temporary laziness thing. Will change to handles by species reee.
	if(dna.species.space_move(src))
		return TRUE
	return ..()
