/obj/effect/landmark/virtual_reality
	name = "virtual_reality"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	anchored = 1.0

	var/decl/hierarchy/outfit/spawn_outfit = /decl/hierarchy/outfit/vr

/obj/effect/landmark/virtual_reality/New()
	..()
	tag = "virtual_reality*[name]"
	invisibility = 101
	return 1

/obj/effect/landmark/vr_spawner
	name = "virtual reality spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	anchored = 1.0

	var/spawn_type		// what will this spawn? can be mob or item, I suppose
	var/active = TRUE	//is this active or dormant?
	var/key			//what makes this listen?

	var/spawn_time	= 20	//how long does it take to spawn one of these things?

/obj/effect/landmark/vr_spawner/New()
	..()
	tag = "vr_spawn*[name]"
	invisibility = 101
	return 1

/obj/effect/landmark/vr_spawner/proc/vr_spawn()
	sleep(spawn_time)
	var/spawned = new spawn_type(src)

	if(istype(spawned, /mob/living/simple_animal))
		var/mob/living/simple_animal/SA = spawned
		SA.VR_key = key
		SA.virtual_reality = TRUE

	return 1