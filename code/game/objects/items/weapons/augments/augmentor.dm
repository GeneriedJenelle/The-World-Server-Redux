/obj/item/weapon/augmentor
	name = "augmentor"
	desc = "A menacing looking device used to activate and implant cybernetic augmentations."
	icon = 'icons/obj/augments.dmi'
	icon_state = "augmentor0_1"
	item_state = "augmentor0_0"
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_SMALL
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "glass" = 1000)
	var/obj/item/weapon/augment/aug = null
	var/active = 0


/obj/item/weapon/augmentor/attack_self(var/mob/user)
	active = !active
	to_chat(user, "<span class='notice'>You [active ? "" : "de"]activate \the [src].</span>")
	update()

/obj/item/weapon/augmentor/verb/remove_augment(var/mob/user)
	set category = "Object"
	set name = "Remove Augment"
	set src in usr

	if(!aug)
		return
	aug.loc = get_turf(src)
	user.put_in_hands(aug)
	to_chat(user, "<span class='notice'>You remove \the [aug] from \the [src].</span>")
	name = "augmentor"
	aug = null
	update()

	return

/obj/item/weapon/augmentor/proc/update()
	if (src.aug)
		src.icon_state = "augmentor1"

	else
		src.icon_state = "augmentor0"
	src.icon_state += "_[active]"
	return

/obj/item/weapon/augmentor/attack(mob/M as mob, mob/user as mob)
	if (!istype(M, /mob/living/carbon))
		return
	if(active)
		if (aug)
			M.visible_message("<span class='warning'>[user] is attempting to augment [M].</span>")

			user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
			user.do_attack_animation(M)

			var/turf/T1 = get_turf(M)
			if (T1 && ((M == user) || do_after(user, 50)))
				if(user && M && (get_turf(M) == T1) && src && src.aug)
					M.visible_message("<span class='warning'>[M] has been augmented by [user].</span>")

					add_attack_logs(user,M,"Augmented with [aug.name] using [name]")

					if(aug.handle_augment(M))
						aug.post_augment(M)

						if(ishuman(M))
							var/mob/living/carbon/human/H = M
							BITSET(H.hud_updateflag, IMPLOYAL_HUD)

					src.aug = null
					update()
	else
		to_chat(user, "<span class='warning'>You need to activate \the [src.name] first.</span>")
	return