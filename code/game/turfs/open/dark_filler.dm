// Like basic space but doesn't have the space plane.
/turf/open/dark_filler
	name = "\proper nothing"
	icon = 'icons/turf/space.dmi'
	icon_state = "black"

/turf/open/dark_filler/New()	//Do not convert to Initialize
	//This is used to optimize the map loader
	return

// These procs should never do anything.
/turf/open/dark_filler/get_sky_and_weather_states()
	return
/turf/open/dark_filler/get_ceiling_status(as_ceiling)
	return
