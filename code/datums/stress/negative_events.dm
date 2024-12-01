/datum/stressevent/vice
	timer = 5 MINUTES
	stressadd = 3
	desc = list(span_red("I don't indulge my vice."),span_red("I need to sate my vice."))

/*
/datum/stressevent/failcraft
	timer = 15 SECONDS
	stressadd = 1
	max_stacks = 10
	desc = span_red("I've failed to craft something.")
*/

/datum/stressevent/miasmagas
	timer = 10 SECONDS
	stressadd = 1
	desc = span_red("Smells like death here.")

/datum/stressevent/peckish
	timer = 10 MINUTES
	stressadd = 1
	desc = span_red("I'm peckish.")

/datum/stressevent/hungry
	timer = 10 MINUTES
	stressadd = 2
	desc = span_red("I'm hungry.")

/datum/stressevent/starving
	timer = 10 MINUTES
	stressadd = 3
	desc = span_red("I'm starving.")

/datum/stressevent/drym
	timer = 10 MINUTES
	stressadd = 1
	desc = span_red("I'm a little thirsty.")

/datum/stressevent/thirst
	timer = 10 MINUTES
	stressadd = 2
	desc = span_red("I'm thirsty.")

/datum/stressevent/parched
	timer = 10 MINUTES
	stressadd = 3
	desc = span_red("I'm going to die of thirst.")

/datum/stressevent/dismembered
	timer = 40 MINUTES
	stressadd = 5
	desc = span_boldred("MY LIMB IS GONE!!!")

/datum/stressevent/dwarfshaved
	timer = 40 MINUTES
	stressadd = 6
	desc = span_red("I'd rather cut my own throat than my beard.")

/datum/stressevent/viewdeath
	timer = 1 MINUTES
	stressadd = 1
//	desc = span_red("Death...")

/datum/stressevent/viewdeath/get_desc(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna?.species)
			return span_red("Another [H.dna.species.id] perished.")
	return desc

/datum/stressevent/viewdismember
	timer = 15 MINUTES
	max_stacks = 5
	stressadd = 2
	desc = span_red("I've seen men lose their limbs.")


/datum/stressevent/fviewdismember
	timer = 1 MINUTES
	max_stacks = 10
	stressadd = 1
	stressadd_per_extra_stack = 1
	desc = span_red("I saw something horrible!")

/datum/stressevent/viewgib
	timer = 5 MINUTES
	stressadd = 2
	desc = span_red("I saw something ghastly.")

/datum/stressevent/bleeding
	timer = 2 MINUTES
	stressadd = 1
	desc = list(span_red("I think I'm bleeding."),span_red("I'm bleeding."))

/datum/stressevent/bleeding/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/painmax
	timer = 1 MINUTES
	stressadd = 2
	desc = span_red("THE PAIN!")

/datum/stressevent/painmax/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/freakout
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("I'm panicking!")

/datum/stressevent/felldown
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("I fell. I'm a fool.")

/datum/stressevent/hatezizo
	timer = 30 MINUTES
	stressadd = 10 // enough to instill mental breaks with any more stress of any source, and heart attack if too worse.
	desc = "<span class='red'>A NEW GOD is upon us!</span>"

/datum/stressevent/burntmeal
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("YUCK!")

/datum/stressevent/rotfood
	timer = 2 MINUTES
	stressadd = 4
	desc = span_red("YUCK!")

/datum/stressevent/psycurse
	timer = 999 MINUTES
	stressadd = 5
	desc = span_red("Oh no! I've received divine punishment!")

/datum/stressevent/virginchurch
	timer = 999 MINUTES
	stressadd = 10
	desc = span_boldred("I have broken my oath of chastity to The Gods!")

/datum/stressevent/badmeal
	timer = 3 MINUTES
	stressadd = 2
	desc = span_red("It tastes VILE!")

/datum/stressevent/vomit
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("I puked!")

/datum/stressevent/vomitself
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("I puked on myself!")

/datum/stressevent/cumbad
	timer = 5 MINUTES
	stressadd = 5
	desc = span_red("I was violated.")

/datum/stressevent/cumcorpse
	timer = 1 MINUTES
	stressadd = 10
	desc = span_boldred("What have I done?")

/datum/stressevent/loinache
	timer = 1 MINUTES
	stressadd = 2
	desc = list(span_red("My loins took a bad beating!"),span_red("My loins got slammed badly!"),span_red("My loins got beaten badly!"))

/datum/stressevent/leechcult
	timer = 1 MINUTES
	stressadd = 3
	desc = list("<span class='red'>There's a little goblin in my head telling me to do things and I don't like it!</span>","<span class='red'>\"Kill your friends.\"</span>","<span class='red'>\"Make them bleed.\"</span>","<span class='red'>\"Give them no time to squeal.\"</span>","<span class='red'>\"Praise Zizo.\"</span>","<span class='red'>\"Death to the Ten.\"</span>","<span class='red'>\"The Weeper weeps his last.\"</span>")

/datum/stressevent/delf
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Better stay away.")

/datum/stressevent/shunned_race
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("A loathesome dark elf.")

/datum/stressevent/tieb
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Helldweller... better stay away.")

/datum/stressevent/brazillian
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("A vile lizard.")

/datum/stressevent/shunned_race_xenophobic
	timer = 2 MINUTES
	stressadd = 5
	desc = span_red("Better stay away.")

/datum/stressevent/paracrowd
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("There are too many people who don't look like me here.")

/datum/stressevent/parablood
	timer = 15 SECONDS
	stressadd = 3
	desc = span_red("There is so much blood here... it's like a battlefield!")

/datum/stressevent/parastr
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("That beast is stronger... and might easily kill me!")

/datum/stressevent/paratalk
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("They are plotting against me in evil tongues...")

/datum/stressevent/crowd
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Why is everyone here...? Are they trying to kill me?!</span>"

/datum/stressevent/nopeople
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Where did everyone go? Did something happen?!</span>"

/datum/stressevent/jesterphobia
	timer = 4 MINUTES
	stressadd = 5
	desc = span_red("No! Get the Jester away from me!")

/datum/stressevent/jesterphobia
	timer = 4 MINUTES
	stressadd = 5
	desc = span_boldred("No! Get the Jester away from me!")

/datum/stressevent/coldhead
	timer = 60 SECONDS
	stressadd = 1
	desc = span_red("My head is cold.")

/datum/stressevent/sleepytime
	timer = 0
	stressadd = 1
	desc = span_red("I'm tired.")

/datum/stressevent/trainsleep
	timer = 0
	stressadd = 1
	desc = span_red("My muscles ache.")

/datum/stressevent/tortured
	stressadd = 3
	max_stacks = 5
	stressadd_per_extra_stack = 2
	desc = span_boldred("I'm broken.")
	timer = 60 SECONDS

/datum/stressevent/confessed
	stressadd = 3
	desc = span_red("I've confessed to sin.")
	timer = 15 MINUTES

/datum/stressevent/confessedgood
	stressadd = 1
	desc = span_red("I've confessed to sin, it feels good.")
	timer = 15 MINUTES

/datum/stressevent/saw_wonder
	stressadd = 4
	desc = span_dead("<B>I have seen something nightmarish, and I fear for my life!</B>")
	timer = null

/datum/stressevent/maniac_woke_up
	stressadd = 10
	desc = span_danger("No... I want to go back...")

/datum/stressevent/drankrat
	stressadd = 1
	desc = span_red("I drank from a lesser creature.")
	timer = 1 MINUTES

/datum/stressevent/lowvampire
	stressadd = 1
	desc = span_red("I'm dead... what comes next?")

/datum/stressevent/oziumoff
	stressadd = 20
	desc = span_blue("I need another hit.")
	timer = 1 MINUTES

/datum/stressevent/ooc_ic
	stressadd = 6
	desc = span_boldred("Bad omen! I've broken some kind of wall...")
	timer = 5 MINUTES

/datum/stressevent/sleepfloor
	stressadd = 3
	desc = "I slept on the floor. It was uncomfortable."
	timer = 1 MINUTES

/datum/stressevent/sleepfloornoble
	stressadd = 6
	desc = "I slept on the floor! What am I?! An animal?!"
	timer = 3 MINUTES
