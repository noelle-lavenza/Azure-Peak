SUBSYSTEM_DEF(icon_smooth)
	name = "Icon Smoothing"
	init_order = INIT_ORDER_ICON_SMOOTHING
	wait = 1
	priority = FIRE_PRIOTITY_SMOOTHING
	flags = SS_TICKER
//	flags = SS_NO_FIRE
	///Blueprints assemble an image of what pipes/manifolds/wires look like on initialization, and thus should be taken after everything's been smoothed
	var/list/blueprint_queue = list()
	var/list/smooth_queue = list()
	var/list/deferred = list()

/datum/controller/subsystem/icon_smooth/fire()
	var/list/cached = smooth_queue
	while(cached.len)
		var/atom/A = cached[cached.len]
		cached.len--
		if (A.flags_1 & INITIALIZED_1)
			smooth_icon(A)
		else
			deferred += A
		if (MC_TICK_CHECK)
			return

	if (!cached.len)
		if (deferred.len)
			smooth_queue = deferred
			deferred = cached
		else
			can_fire = 0

/datum/controller/subsystem/icon_smooth/Initialize()
	// Even our test map has 2z (centcom and the actual map itself)
	// so it's always safe to batch-smooth the first 2 levels.
	smooth_zlevel(1,TRUE)
	smooth_zlevel(2,TRUE)
	var/queue = smooth_queue
	smooth_queue = list()
	for(var/atom/A as anything in queue)
		if(!A)
			continue
		if(A.z <= 2)
			A.smooth &= ~SMOOTH_QUEUED // unqueue so it can update later
			continue
		smooth_icon(A)
		CHECK_TICK
	queue = blueprint_queue
	blueprint_queue = list()
	var/turf/T
	for(var/atom/movable/AM as anything in queue)
		T = get_turf(AM)
		if(T)
			T.add_blueprints(AM)

	return ..()
