/obj/item/weapon/storage/briefcase
	name = "briefcase"
	desc = "It's made of AUTHENTIC faux-leather and has a price-tag still attached. Its owner must be a real professional."
	icon_state = "briefcase"
	flags = CONDUCT
	force = 8.0
	throw_speed = 1
	throw_range = 4
	w_class = ITEMSIZE_LARGE
	max_w_class = ITEMSIZE_NORMAL
	max_storage_space = ITEMSIZE_COST_NORMAL * 4
	use_sound = 'sound/items/storage/briefcase.ogg'
	drop_sound = 'sound/items/drop/backpack.ogg'

	var/open = 0

	examine(mob/user)
		if(..(user, 1))
			user << text("The breifcase is [src.open ? "open" : "closed"].")

	verb/open_case()
		set name = "Open Briefcase"
		set category = "Object"
		set src in view(1)

		if(usr.stat || usr.restrained() || usr.lying || !istype(usr, /mob/living))
			to_chat(usr, "<span class='warning'>You can't do that.</span>")
			return open

		if(!Adjacent(usr))
			to_chat(usr, "You can't reach it.")
			return open

		if(!istype(loc,/turf))
			to_chat(usr, "[src] is too bulky!  You'll have to set it down.")
			return open

		if(open == 1)
			icon_state = "briefcase"
			return 0
		else
			icon_state = "briefcaseopen"
			return 1

	AltClick()
		open = open_case()

	attack_hand(mob/user as mob)
		if ((src.loc == user) && (src.open == 0))
			usr << "<span class='warning'>[src] needs to be set down and opened!</span>"
		else if ((src.loc == user) && (src.open == 1))
			src.open(usr)
		else
			..()
			for(var/mob/M in range(1))
				if (M.s_active == src)
					src.close(M)
		src.add_fingerprint(user)
		return

/obj/item/weapon/storage/briefcase/clutch
	name = "clutch purse"
	desc = "A fashionable handheld bag typically used by women."
	icon_state = "clutch"
	item_state_slots = list(slot_r_hand_str = "smpurse", slot_l_hand_str = "smpurse")
	force = 0
	w_class = ITEMSIZE_NORMAL
	max_w_class = ITEMSIZE_SMALL
	max_storage_space = ITEMSIZE_COST_SMALL * 4