/obj/item/organ/internal/augment/pelvic/superjump
	name = "hip extensor augment"
	desc = "An overclocker that supercharges hip extensor muscle fibers allowing for substantially increased jump height and distance."
	icon_state = "augment_jump"
	organ_tag = O_AUG_PELVIC
	parent_organ = BP_GROIN
	target_parent_classes = list(ORGAN_ROBOT, ORGAN_LIFELIKE)
	aug_cooldown = 1 MINUTES

/obj/item/organ/internal/augment/pelvic/superjump/augment_action()
	if(!owner)
		return

	if(aug_cooldown)
		if(last_activate <= world.time + aug_cooldown)
			last_activate = world.time
		else
			return

		if(istype(owner, /mob/living/carbon/human))
			var/failure = 0
			if(istype(usr.loc,/mob/) || usr.lying || usr.stunned || usr.buckled || usr.stat)
				to_chat(usr, "<span class='warning'>You can't jump right now!</span>")
				return

			if(istype(usr.loc,/turf/))
				if(usr.restrained())//Why being pulled while cuffed prevents you from moving
					for(var/mob/M in range(usr, 1))
						if(M.pulling == usr)
							if(!M.restrained() && M.stat == 0 && M.canmove && usr.Adjacent(M))
								failure = 1
							else
								M.stop_pulling()

				usr.visible_message("<span class='danger'>[usr.name]</b> takes a huge leap!</span>")
				playsound(usr.loc, 'sound/weapons/thudswoosh.ogg', 50, 1)
				if(failure)
					usr.Weaken(5)
					usr.Stun(5)
					usr.visible_message("<span class='warning'>[usr] attempts to leap away but is slammed back down to the ground!</span>",
										"<span class='warning'>You attempt to leap away but are suddenly slammed back down to the ground!</span>",
										"<span class='notice'>You hear the flexing of powerful muscles and suddenly a crash as a body hits the floor.</span>")
					return 0
				var/prevLayer = usr.layer
				var/prevFlying = usr.flying
				usr.layer = 9

				usr.flying = 1
				for(var/i=0, i<10, i++)
					step(usr, usr.dir)
					if(i < 5) usr.pixel_y += 8
					else usr.pixel_y -= 8
					sleep(1)
				usr.flying = prevFlying

				if(FAT in usr.mutations && prob(66))
					usr.visible_message("<span class='danger'>[usr.name]</b> crashes due to their heavy weight!</span>")
					//playsound(usr.loc, 'zhit.wav', 50, 1)
					usr.AdjustWeakened(10)
					usr.AdjustStunned(5)

				usr.layer = prevLayer

			if(istype(usr.loc,/obj/))
				var/obj/container = usr.loc
				to_chat(usr, "<span class='warning'>You leap and slam your head against the inside of [container]! Ouch!</span>")
				usr.AdjustParalysis(3)
				usr.AdjustWeakened(5)
				container.visible_message("<span class='danger'>[usr.loc]</b> emits a loud thump and rattles a bit.</span>")
				playsound(usr.loc, 'sound/effects/bang.ogg', 50, 1)
				var/wiggle = 6
				while(wiggle > 0)
					wiggle--
					container.pixel_x = rand(-3,3)
					container.pixel_y = rand(-3,3)
					sleep(1)
				container.pixel_x = 0
				container.pixel_y = 0