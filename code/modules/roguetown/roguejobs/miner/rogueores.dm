/obj/item/rogueore
	name = "ore"
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ore"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/rogueore/gold
	name = "raw gold"
	desc = "A clump of dirty lustrous nuggets!"
	icon_state = "oregold1"
	smeltresult = /obj/item/ingot/gold
	grind_results = list(/datum/reagent/gold = 15)
	sellprice = 10

/obj/item/rogueore/gold/Initialize()
	icon_state = "oregold[rand(1,3)]"
	..()


/obj/item/rogueore/silver
	name = "raw silver"
	desc = "A gleaming ore of moonlight hue."
	icon_state = "oresilv1"
	smeltresult = /obj/item/ingot/silver
	grind_results = list(/datum/reagent/silver = 15)
	sellprice = 8

/obj/item/rogueore/silver/Initialize()
	icon_state = "oresilv[rand(1,3)]"
	..()


/obj/item/rogueore/iron
	name = "raw iron"
	desc = "A dark ore of rugged strength."
	icon_state = "oreiron1"
	smeltresult = /obj/item/ingot/iron
	grind_results = list(/datum/reagent/iron = 15)
	sellprice = 5

/obj/item/rogueore/iron/Initialize()
	icon_state = "oreiron[rand(1,3)]"
	..()


/obj/item/rogueore/copper
	name = "raw copper"
	desc = "A burnished ore with reddish gleams."
	icon_state = "orecop1"
	smeltresult = /obj/item/ingot/copper
	grind_results = list(/datum/reagent/copper = 15)
	sellprice = 3

/obj/item/rogueore/copper/Initialize()
	icon_state = "orecop[rand(1,3)]"
	..()

/obj/item/rogueore/coal
	name = "coal"
	desc = "Dark lumps that become smoldering embers later in life."
	icon_state = "orecoal1"
	firefuel = 60 MINUTES
	smeltresult = /obj/item/rogueore/coal
	grind_results = list(/datum/reagent/fuel/oil = 15)
	sellprice = 1

/obj/item/rogueore/coal/Initialize()
	icon_state = "orecoal[rand(1,3)]"
	..()

/obj/item/rogueore/sand
	name = "sand"
	desc = "A pile of sand waiting to be glass."
	icon_state = "oresand"
	smeltresult = /obj/item/ingot/glass
	sellprice = 4

// pocket sand!!
// copied from /obj/item/stack/ore/glass/throw_impact
/obj/item/rogueore/sand/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(..() || !ishuman(hit_atom))
		return
	// 20% chance if thrown by an explosion or something, otherwise thrower must have targeted head
	if((isnull(throwingdatum?.target_zone) && prob(80)) || ran_zone(throwingdatum?.target_zone) != BODY_ZONE_HEAD)
		return
	var/mob/living/carbon/human/humie = hit_atom
	if(humie.is_eyes_covered())
		humie.visible_message(span_danger("[humie]'s eye protection blocks the sand!"), span_warning("My eye protection blocks the sand!"))
		return
	humie.adjust_blurriness(6)
	humie.adjustStaminaLoss(15)//the pain from my eyes burning does stamina damage
	humie.confused += 5
	to_chat(humie, span_danger("\The [src] gets into my eyes! The pain, it burns!"))
	qdel(src)

/obj/item/rogueore/cinnabar
	name = "cinnabar"
	desc = "Red gems that contain the essence of quicksilver."
	icon_state = "orecinnabar"
	grind_results = list(/datum/reagent/mercury = 15)
	sellprice = 5

/obj/item/ingot
	name = "ingot"
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ingot"
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = null
	var/datum/anvil_recipe/currecipe
	var/quality = SMELTERY_LEVEL_NORMAL
	var/smelted = FALSE

/obj/item/ingot/Initialize(mapload, smelt_quality)
	. = ..()
	if(smelt_quality)
		quality = smelt_quality
		smelted = TRUE
		switch(quality)
			if(SMELTERY_LEVEL_SPOIL)
				name = "spoilt-quality [name]"
			if(SMELTERY_LEVEL_POOR)
				name = "poor-quality [name]"
			if(SMELTERY_LEVEL_GOOD)
				name = "good-quality [name]"
			if(SMELTERY_LEVEL_EXPERT)         //This ores are getting the same quality as good. Can be expanded for better ones in the future
				name = "good-quality [name]"
			if(SMELTERY_LEVEL_MASTER)
				name = "good-quality [name]"
			if(SMELTERY_LEVEL_LEGENDARY)
				name = "good-quality [name]"

/obj/item/ingot/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/tongs))
		var/obj/item/rogueweapon/tongs/T = I
		if(!T.hingot)
			forceMove(T)
			T.hingot = src
			T.hott = null
			T.update_icon()
			return
	..()

/obj/item/ingot/Destroy()
	if(currecipe)
		QDEL_NULL(currecipe)
	if(istype(loc, /obj/machinery/anvil))
		var/obj/machinery/anvil/A = loc
		A.hingot = null
		A.update_icon()
	..()

/obj/item/ingot/gold
	name = "gold bar"
	desc = "Solid wealth in your hands."
	icon_state = "ingotgold"
	smeltresult = /obj/item/ingot/gold
	grind_results = list(/datum/reagent/gold = 15)
	sellprice = 100

/obj/item/ingot/iron
	name = "iron bar"
	desc = "Forged strength. Essential for crafting."
	icon_state = "ingotiron"
	smeltresult = /obj/item/ingot/iron
	grind_results = list(/datum/reagent/iron = 15)
	sellprice = 25

/obj/item/ingot/copper
	name = "copper bar"
	desc = "An ingot of malleable essence."
	icon_state = "ingotcop"
	smeltresult = /obj/item/ingot/copper
	grind_results = list(/datum/reagent/copper = 15)
	sellprice = 10

/obj/item/ingot/silver
	name = "silver bar"
	desc = "This bar radiates purity. Treasured by the realms."
	icon_state = "ingotsilv"
	smeltresult = /obj/item/ingot/silver
	grind_results = list(/datum/reagent/silver = 15)
	sellprice = 60

/obj/item/ingot/steel
	name = "steel bar"
	desc = "This ingot is a stalwart defender of the kingdom."
	icon_state = "ingotsteel"
	smeltresult = /obj/item/ingot/steel
	sellprice = 40

/obj/item/ingot/glass
	name = "glass sheet"
	desc = "Glass, Essential for bottles and windows."
	icon_state = "ingotglass"
	smeltresult = /obj/item/ingot/glass
	grind_results = list(/datum/reagent/glass = 15)
	sellprice = 15

/obj/item/rogueore/psteel
	name = "pig iron mix"
	desc = "a crude mix of carbon and iron, wasteful but smeltable into steel."
	icon_state = "oreada"
	smeltresult = /obj/item/ingot/steel
	grind_results = list(/datum/reagent/iron = 15)
	sellprice = 15
