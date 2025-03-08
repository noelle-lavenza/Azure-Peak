/mob/living/carbon/human/species/elf/dark/drowraider
	aggressive=1
	mode = AI_IDLE
	faction = list("drow")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	stand_attempts = 6
	possible_rmb_intents = list()


/mob/living/carbon/human/species/elf/dark/drowraider/ambush
	aggressive=1
	wander = TRUE

/mob/living/carbon/human/species/elf/dark/drowraider/retaliate(mob/living/L)
	.=..()
	if(target)
		aggressive=1
		wander = TRUE

/mob/living/carbon/human/species/elf/dark/drowraider/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/elf/dark/drowraider/Initialize()
	. = ..()
	set_species(/datum/species/elf/dark)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)


/mob/living/carbon/human/species/elf/dark/drowraider/after_creation()
	..()
	job = "Drow Raider"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/elf/dark/drowraider)

	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)

	if(organ_eyes)
		organ_eyes.eye_color = pick("#FFBF00","#C41E3A")
		organ_eyes.accessory_colors = pick("#FFBF00","#C41E3A")
	
	if(organ_ears)
		organ_ears.accessory_colors = "#5f5f70"
	
	skin_tone = "#5f5f70"

	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/elf/elfdf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/elf/elfdm.txt"))

	update_hair()
	update_body()

/mob/living/carbon/human/species/elf/dark/drowraider/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))

/mob/living/carbon/human/species/elf/dark/drowraider/handle_combat()
	if(mode == AI_HUNT)
		if(prob(10))
			emote("laugh")
	. = ..()

/datum/outfit/job/roguetown/human/species/elf/dark/drowraider/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/councillor
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	if(prob(50))
		mask = /obj/item/clothing/mask/rogue/ragmask/black
	head = /obj/item/clothing/head/roguetown/roguehood/black
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/kettle
	neck = /obj/item/clothing/neck/roguetown/bevor
	if(prob(50))
		neck = /obj/item/clothing/neck/roguetown/gorget
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots
	H.STASTR = rand(14,16)
	H.STASPD = rand(10,14)
	H.STACON = rand(10,14)
	H.STAEND = 15
	H.STAPER = 10
	H.STAINT = 10
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/falx
		l_hand = /obj/item/rogueweapon/shield/tower
	else
		r_hand = /obj/item/rogueweapon/halberd/glaive
