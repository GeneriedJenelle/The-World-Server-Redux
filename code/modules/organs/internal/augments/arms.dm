/obj/item/organ/internal/augment/arms
	name = "arm augmentation"
	desc = "A large augment that fits into a subject's arm."
	icon_state = "augment_box"
	w_class = ITEMSIZE_LARGE
	organ_tag = O_AUG_L_FOREARM
	parent_organ = BP_L_ARM
	target_slot = slot_l_hand
	target_parent_classes = list(ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = null

/obj/item/organ/internal/augment/arms/attackby(obj/item/I as obj, mob/user as mob)
	if(I.is_screwdriver())
		switch(organ_tag)
			if(O_AUG_L_FOREARM)
				organ_tag = O_AUG_R_FOREARM
				parent_organ = BP_R_ARM
				target_slot = slot_r_hand
			if(O_AUG_R_FOREARM)
				organ_tag = O_AUG_L_FOREARM
				parent_organ = BP_L_ARM
				target_slot = slot_l_hand
		to_chat(user, "<span class='notice'>You swap \the [src]'s servos to install neatly into \the lower [parent_organ] mount.</span>")
		return

	. = ..()

///WEAPONS////

/obj/item/organ/internal/augment/arms/laser
	name = "laser cannon augment"
	desc = "A laser-emitting array designed to be deployed from a cybernetic arm."
	icon_state = "augment_laser"
	integrated_object_type = /obj/item/weapon/gun/energy/laser/mounted/augment

/obj/item/organ/internal/augment/arms/tesla
	name = "tesla array augment"
	desc = "A powerful tesla array designed to be deployed from a cybernetic arm."
	icon_state = "augment_tesla"
	integrated_object_type = /obj/item/weapon/gun/energy/tesla/augment

/obj/item/organ/internal/augment/arms/armblade
	name = "armblade augment"
	desc = "A sharp titanium blade designed to be deployed from a cybernetic arm."
	icon_state = "augment_armblade"
	integrated_object_type = /obj/item/weapon

/obj/item/organ/internal/augment/arms/armblade/energy
	name = "energy blade augment"
	desc = "A high-frequency plasma blade designed to be deployed from a cybernetic arm."
	icon_state = "augment_energyblade"
	integrated_object_type = /obj/item/weapon
///////////////
//HAND AUGMENTS
///////////////
/obj/item/organ/internal/augment/hands
	name = "arm augmentation"
	desc = "A large augment that fits into a subject's arm."
	icon_state = "augment_box"
	w_class = ITEMSIZE_SMALL
	organ_tag = O_AUG_L_HAND
	parent_organ = BP_L_HAND
	target_slot = slot_l_hand
	target_parent_classes = list(ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = null

/obj/item/organ/internal/augment/hands/attackby(obj/item/I as obj, mob/user as mob)
	if(I.is_screwdriver())
		switch(organ_tag)
			if(O_AUG_L_HAND)
				organ_tag = O_AUG_R_HAND
				parent_organ = BP_R_HAND
				target_slot = slot_r_hand
			if(O_AUG_R_HAND)
				organ_tag = O_AUG_L_HAND
				parent_organ = BP_L_HAND
				target_slot = slot_l_hand
		to_chat(user, "<span class='notice'>You swap \the [src]'s servos to install neatly into \the lower [parent_organ] mount.</span>")
		return

	. = ..()

/obj/item/organ/internal/augment/hands/dart
	name = "wrist-mounted dart thrower"
	desc = "A discreet dart launcher that deploys from the wrist of a cybernetic arm."
	icon_state = "augment_dart"
	integrated_object_type = /obj/item/weapon/gun/projectile/dartgun/augment

/obj/item/organ/internal/augment/hands/lighter
	name = "finger lighter augment"
	desc = "A small lighter that deploys from a cybernetic finger."
	icon_state = "augment_lighter"
	integrated_object_type = /obj/item/weapon/flame/lighter/augment

/obj/item/organ/internal/augment/hands/datajack
	name = "datajack augment"
	desc = "An augment that allows for interfacing with compatible hardware."
	icon_state = "augment_datajack"
	integrated_object_type = /obj/item/device/datajack

/obj/item/device/datajack
	name = "\improper datajack"
	desc = "A device that can perform various functions across a multitude of compatible devices."
	icon = 'icons/obj/augments.dmi'
	icon_state = "augment_datajack"
	var/mode = "diagnostic"
	var/list/modes = list("diagnostic", "blackice", "shutdown")

/obj/item/device/datajack/attack_self(mob/user as mob)
	to_chat(user, "<span class='notice'>Your [src] has the following functions installed:</span>")
	for(var/modenames in modes)
		to_chat(user, "<span class='notice'>[modenames]</span>")

/obj/item/device/datajack/attack(mob/living/carbon/human/M, mob/living/user)
	var/has_dataport = 0
	for(var/obj/item/organ/internal/augment/aug in M.internal_organs)
		if(istype(aug, /obj/item/organ/internal/augment/inputport))
			user.visible_message("<span class='warning' = [user] places their datajack into [M]'s dataport.</span>", \
			"<span class='warning'>You place your datajack into [M]'s dataport.</span>")
			has_dataport = 1

			if(has_dataport)
				var/mode = input("Select a function.", "Datajack Functions") in modes
				if(mode == "diagnostic")
					to_chat(user, "<span class='notice'>Performing diagnostic, please wait...</span>")
					sleep(50)
					var/output = "<span class='notice'>Diagnostic Results:\n</span>"

					output += "Internal Temperature: [convert_k2c(M.bodytemperature)] Degrees Celsius\n"

					output += "Current Battery Charge: [M.nutrition]\n"

					var/toxDam = M.getToxLoss()
					if(toxDam)
						output += "System Instability: <span class='warning'>[toxDam > 25 ? "Severe" : "Moderate"]</span>. Direct target to charging station for cleanup.\n"
					else
						output += "System Instability: <span style='color:green;'>OK</span>\n"

					for(var/obj/item/organ/external/EO in M.organs)
						if(EO.robotic)
							if(EO.brute_dam || EO.burn_dam)
								output += "[EO.name] - <span class='warning'>[EO.burn_dam + EO.brute_dam > ROBOLIMB_REPAIR_CAP ? "Heavy Damage" : "Light Damage"]</span>\n"
							else
								output += "[EO.name] - <span style='color:green;'>OK</span>\n"

					for(var/obj/item/organ/IO in M.internal_organs)
						if(IO.robotic)
							if(IO.damage)
								output += "[IO.name] - <span class='warning'>[IO.damage > 10 ? "Heavy Damage" : "Light Damage"]</span>\n"
							else
								output += "[IO.name] - <span style='color:green;'>OK</span>\n"

					user << output

				if(mode == "blackice")
					var/blackice_delay = 120
					to_chat(M, "<span class='warning'>WARNING: Malicious ICE detected! System integrity at risk!")
					to_chat(src, "<span class='warning'>You begin uploading the Black ICE into [M]'s subroutines!")
					if(do_after(user, blackice_delay))
						to_chat(M, "<span class='warning'>WARNING! Malici--@#$C@ -- COMP@%M!$ED! ERROR!")
						to_chat(user, "<span class='warning'>You successfully upload the Black ICE into [M]'s subroutines!")
						M.Weaken(10)
						M.eye_blurry = max(M.eye_blurry, 10)
						for(var/mob/H in oviewers(world.view, M))
							H << "<font color='red'><B>[M] flails around wildly.</B></font>"

				if(mode == "shutdown")
					var/shutdown_delay = 80
					to_chat(M, "<span class='warning'>WARNING: Force shutddown initiated in augmentation subroutines!")
					to_chat(user, "<span class='warning'>You begin sending the Force Shutdown command into [M]'s subroutines!")
					if(do_after(user, shutdown_delay))
						for(var/obj/item/organ/internal/augment/A in M.internal_organs)
							A.disabled = 1
						to_chat(M, "<span class='danger'>Augmentation functions disabled!")
						M.drop_item()
			else
				usr << "<span class ='warning'>[M]'s dataport has extensive firewalls!</span>"
		else
			user << "<span class='warning'>[M] does not have a compatible dataport!"