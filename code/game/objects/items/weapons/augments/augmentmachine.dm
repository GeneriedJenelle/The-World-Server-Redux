//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/machinery/augmentmachine
	name = "augmentation chamber"
	desc = "A machine that uses advanced robotics software to augment synthetic beings."
	icon = 'icons/obj/augments.dmi'
	icon_state = "augment_machine"
	density = 1
	opacity = 0
	anchored = 1

	var/ready = 1
	var/malfunction = 0
	var/list/obj/item/weapon/augment/augment_list = list()
	var/max_augments = 5
	var/injection_cooldown = 600
	var/replenish_cooldown = 6000
	var/replenishing = 0
	var/mob/living/carbon/occupant = null
	var/injecting = 0

	proc
		go_out()
		put_mob(mob/living/carbon/M as mob)
		augment(var/mob/M)
		add_augments()


	New()
		..()
		add_augments()


	attack_hand(mob/user as mob)
		user.set_machine(src)
		var/health_text = ""
		if(src.occupant)
			if(src.occupant.health <= -100)
				health_text = "<FONT color=red>Dead</FONT>"
			else if(src.occupant.health < 0)
				health_text = "<FONT color=red>[round(src.occupant.health,0.1)]</FONT>"
			else
				health_text = "[round(src.occupant.health,0.1)]"

		var/dat ="<B>Augmentation Chamber Status</B><BR>"

		dat +="<B>Current occupant:</B> [src.occupant ? "<BR>Name: [src.occupant]<BR>Health: [health_text]<BR>" : "<FONT color=red>None</FONT>"]<BR>"
		dat += "<B>Augments:</B> [src.augment_list.len ? "[augment_list.len]" : "<A href='?src=\ref[src];replenish=1'>Replenish</A>"]<BR>"
		if(src.occupant)
			dat += "[src.ready ? "<A href='?src=\ref[src];augment=1'>Augment</A>" : "Recharging"]<BR>"
		user.set_machine(src)
		user << browse(dat, "window=augment")
		onclose(user, "augment")


	Topic(href, href_list)
		if((get_dist(src, usr) <= 1) || istype(usr, /mob/living/silicon/ai))
			if(href_list["augment"])
				if(src.occupant)
					injecting = 1
					go_out()
					ready = 0
					spawn(injection_cooldown)
						ready = 1

			if(href_list["replenish"])
				ready = 0
				spawn(replenish_cooldown)
					add_augments()
					ready = 1

			src.updateUsrDialog()
			src.add_fingerprint(usr)
			return

/obj/machinery/augmentmachine/attackby(var/obj/item/I, var/mob/user)
	add_fingerprint(user)
	if(istype(I, /obj/item/weapon/grab))
		var/obj/item/weapon/grab/G = I
		if(G.affecting)
			go_in(G.affecting, user)
	else if(default_deconstruction_screwdriver(user, I))
		return
	else if(default_deconstruction_crowbar(user, I))
		return
	else if(istype(I, /obj/item/weapon/reagent_containers/glass))
		if(!beaker)
			beaker = I
			user.drop_item()
			I.loc = src
			user.visible_message("<span class='notice'>\The [user] adds \a [I] to \the [src].</span>", "<span class='notice'>You add \a [I] to \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>\The [src] has a beaker already.</span>")
		return


	go_out(var/mob/M)
		if(!( src.occupant ))
			return
		if (src.occupant.client)
			src.occupant.client.eye = src.occupant.client.mob
			src.occupant.client.perspective = MOB_PERSPECTIVE
		src.occupant.loc = src.loc
		if(injecting)
			augment(src.occupant)
			injecting = 0
		src.occupant = null
		icon_state = "augment_machine"
		return


	put_mob(mob/living/carbon/M as mob)
		if(!iscarbon(M))
			usr << "<span class='warning'>\The [src] cannot hold this!</span>"
			return
		if(src.occupant)
			usr << "<span class='warning'>\The [src] is already occupied!</span>"
			return
		if(M.client)
			M.client.perspective = EYE_PERSPECTIVE
			M.client.eye = src
		M.stop_pulling()
		M.loc = src
		src.occupant = M
		src.add_fingerprint(usr)
		icon_state = "augment_machine_on"
		return 1


	augment(var/mob/M)
		if (!istype(M, /mob/living/carbon))
			return
		if(!augment_list.len)	return
		for(var/obj/item/weapon/augment/aug in augment_list)
			if(!aug)	continue
			if(istype(aug, /obj/item/weapon/augment))
				for (var/mob/O in viewers(M, null))
					O.show_message("<span class='warning'>\The [M] has been augmented by \the [src] with \the [aug].</span>", 1)

			if(aug.handle_augment(M, BP_TORSO))
				aug.post_augment(M)
				break
		return


	add_augments()
		for(var/i=0, i<src.max_augments, i++)
			var/obj/item/weapon/augment/A = new /obj/item/weapon/augment(src)
			augment_list += A
		return

	verb
		get_out()
			set name = "Eject occupant"
			set category = "Object"
			set src in oview(1)
			if(usr.stat != 0)
				return
			src.go_out(usr)
			add_fingerprint(usr)
			return


		move_inside()
			set name = "Move Inside"
			set category = "Object"
			set src in oview(1)
			if(usr.stat != 0 || stat & (NOPOWER|BROKEN))
				return
			put_mob(usr)
			return
