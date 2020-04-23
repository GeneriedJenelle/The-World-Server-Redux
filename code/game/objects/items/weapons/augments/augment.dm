/obj/item/weapon/augment
	name = "augment"
	icon = 'icons/obj/augments.dmi'
	icon_state = "augment_box"
	desc = "A prototype augment box. It doesn't do anything once implanted."
	w_class = ITEMSIZE_TINY
	var/augmented = null
	var/mob/aug_in = null
	var/obj/item/organ/external/part = null
	var/augment_color = "b"
	var/allow_reagents = 0
	var/malfunction = 0
	var/initialize_loc = BP_TORSO
	var/list/possible_targets = list(O_AUG_L_FOREARM, O_AUG_R_FOREARM)
	var/organ_to_implant = /obj/item/organ/internal/augment
	var/organ_display_name = "physiological augment"
	show_messages = 1

/obj/item/weapon/augment/proc/trigger(emote, source as mob)
	return

/obj/item/weapon/augment/proc/activate()
	return

	// What does the implant do upon injection?
	// return 0 if the implant fails (ex. Revhead and loyalty implant.)
	// return 1 if the implant succeeds (ex. Nonrevhead and loyalty implant.)
// Moves the implant where it needs to go, and tells it if there's more to be done in post_implant
/obj/item/weapon/augment/proc/handle_augment(var/mob/source, var/target_zone = BP_TORSO)
	. = TRUE
	aug_in = source
	augmented = TRUE
	if(ishuman(source))
		var/mob/living/carbon/human/H = source
		var/obj/item/organ/external/affected = H.get_organ(target_zone)
		if(affected)
			affected.augments |= src
			part = affected
	if(part)
		forceMove(part)
	else
		forceMove(source)

	listening_objects |= src

/obj/item/weapon/augment/proc/post_augment(var/mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		var/obj/item/organ/NewOrgan = new organ_to_implant()

		var/obj/item/organ/external/E = H.get_organ(NewOrgan.parent_organ)
		to_chat(H, "<span class='notice'>The augment settles into your [part].</span>")
		if(E && !(H.internal_organs_by_name[NewOrgan.organ_tag]))
			spawn(rand(1 SECONDS, 30 SECONDS))
				to_chat(H, "<span class='notice'>\The [src] beep softly in your \the [E] as the augment finishes activating.</span>")

			NewOrgan.forceMove(H)
			NewOrgan.owner = H
			if(E.internal_organs == null)
				E.internal_organs = list()
			E.internal_organs |= NewOrgan
			H.internal_organs_by_name[NewOrgan.organ_tag] = NewOrgan
			H.internal_organs |= NewOrgan
			NewOrgan.handle_organ_mod_special()

			spawn(1)
				if(!QDELETED(src))
					qdel(src)

		else
			qdel(NewOrgan)
			to_chat(H, "<span class='warning'>\The [src] malfunctions as there is already a [src] in your \the [E].</span>")

/obj/item/weapon/augment/proc/get_data()
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b> \"GreyDoctor\" Class Nanite Hive<BR>
<b>Life:</b> Activates upon implantation, destroying itself in the process.<BR>
<b>Important Notes:</b> Nanites will fail to complete their task if a suitable location cannot be found for the organ.<BR>
<HR>
<b>Implant Details:</b><BR>
<b>Function:</b> Nanites will fabricate: <span class='alien'>[organ_display_name]</span><BR>
<b>Special Features:</b> Organ identification protocols.<BR>
<b>Integrity:</b> N/A"}
	return dat

/obj/item/weapon/augment/proc/hear(message, source as mob)
	return

/obj/item/weapon/augment/proc/islegal()
	return 1

/obj/item/weapon/augment/proc/meltdown()	//breaks it down, making implant unrecongizible
	aug_in << "<span class='warning'>You feel something melting inside [part ? "your [part.name]" : "you"]!</span>"
	if (part)
		part.take_damage(burn = 15, used_weapon = "Electronics meltdown")
	else
		var/mob/living/M = aug_in
		M.apply_damage(15,BURN)
	name = "melted augment"
	desc = "Charred circuit in melted plastic case. Wonder what that used to be..."
	icon_state = "augment_melted"
	malfunction = 2

/obj/item/weapon/augment/proc/augment_loadout(var/mob/living/carbon/human/H)
	if(H)
		if(handle_augment(H, initialize_loc))
			invisibility = initial(invisibility)
			post_augment(H)

/obj/item/weapon/augment/Destroy()
	if(part)
		part.augments.Remove(src)
	listening_objects.Remove(src)
	part = null
	aug_in = null
	return ..()

/obj/item/weapon/augment/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/augmentor))
		var/obj/item/weapon/augmentor/augmentor = I
		if(augmentor.aug)
			return // It's full.
		user.drop_from_inventory(src)
		forceMove(augmentor)
		augmentor.aug = src
		augmentor.update()
	else
		..()

//limb augments

/obj/item/weapon/augment/limb
	name = "nanite implant"

	organ_to_implant = /obj/item/organ/internal/augment/arms/laser
	organ_display_name = "physiological augment"

	possible_targets = list(O_AUG_L_FOREARM, O_AUG_R_FOREARM)

/obj/item/weapon/augment/limb/post_augment(var/mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		var/obj/item/organ/NewOrgan = new organ_to_implant()

		var/obj/item/organ/external/E = setup_augment_slots(H, NewOrgan)
		if(E.robotic != 2)
			to_chat(H, "<span class='notice'>You feel a tingling sensation around the augmentation site.</span>")
		else
			to_chat(H, "<span class='notice'>Your self-diagonistic suite begins registering a new peripheral device.</span>")
		if(E && istype(E) && !(H.internal_organs_by_name[NewOrgan.organ_tag]))
			spawn(rand(1 SECONDS, 30 SECONDS))
				if(E.robotic != 2)
					to_chat(H, "<span class='notice'>You feel a pressure around the augmentation site as the tingling fades, the lump caused by the augmentation now gone.</span>")
				else
					to_chat(H, "<span class='notice'>Your self-diagnostic suite finishes registering your new augmentation.</span>")
			NewOrgan.forceMove(H)
			NewOrgan.owner = H
			if(E.internal_organs == null)
				E.internal_organs = list()
			E.internal_organs |= NewOrgan
			H.internal_organs_by_name[NewOrgan.organ_tag] = NewOrgan
			H.internal_organs |= NewOrgan
			NewOrgan.handle_organ_mod_special()

			spawn(1)
				if(!QDELETED(src))
					qdel(src)

		else
			qdel(NewOrgan)
			if(E.robotic != 2)
				to_chat(H, "<span class='warning'>You feel an intense pressure in your \the [E] as there is another identical augmentation in the same area.</span>")
			else
				to_chat(H, "<span class='warning'>WARNING: Multiple identical augmentations detected in \the [E]. Please utilize an analyzer to solve conflicts.</span>")

/obj/item/weapon/augment/limb/proc/setup_augment_slots(var/mob/living/carbon/human/H, var/obj/item/organ/internal/augment/arms/I)
	var/list/Choices = possible_targets.Copy()

	for(var/targ in possible_targets)
		if(H.internal_organs_by_name[targ])
			Choices -= targ

	var/target_choice = null
	if(Choices && Choices.len)
		if(Choices.len == 1)
			target_choice = Choices[1]
		else
			target_choice = input("Choose augment location:") in Choices

	else
		return FALSE

	if(target_choice)
		switch(target_choice)
			if(O_AUG_R_HAND)
				I.organ_tag = O_AUG_R_HAND
				I.parent_organ = BP_R_HAND
				I.target_slot = slot_r_hand
				initialize_loc = BP_R_HAND
			if(O_AUG_L_HAND)
				I.organ_tag = O_AUG_L_HAND
				I.parent_organ = BP_L_HAND
				I.target_slot = slot_l_hand
				initialize_loc = BP_L_HAND
			if(O_AUG_R_FOREARM)
				I.organ_tag = O_AUG_R_FOREARM
				I.parent_organ = BP_R_ARM
				I.target_slot = slot_r_hand
				initialize_loc = "right forearm"
			if(O_AUG_L_FOREARM)
				I.organ_tag = O_AUG_L_FOREARM
				I.parent_organ = BP_L_ARM
				I.target_slot = slot_l_hand
				initialize_loc = "left forearm"
			if(O_AUG_R_UPPERARM)
				I.organ_tag = O_AUG_R_UPPERARM
				I.parent_organ = BP_R_ARM
				I.target_slot = slot_r_hand
				initialize_loc = BP_R_ARM
			if(O_AUG_L_UPPERARM)
				I.organ_tag = O_AUG_L_UPPERARM
				I.parent_organ = BP_L_ARM
				I.target_slot = slot_l_hand
				initialize_loc = BP_L_ARM
			if(O_AUG_R_LEG)
				I.organ_tag = O_AUG_R_LEG
				I.parent_organ = BP_R_LEG
				initialize_loc = BP_R_LEG
			if(O_AUG_L_LEG)
				I.organ_tag = O_AUG_L_LEG
				I.parent_organ = BP_L_LEG
				initialize_loc = BP_L_ARM
			if(O_AUG_PELVIC)
				I.organ_tag = O_AUG_PELVIC
				I.parent_organ = BP_GROIN
				initialize_loc = "pelvis"
			if(O_AUG_DATAJACK)
				I.organ_tag = O_AUG_DATAJACK
				I.parent_organ = BP_HEAD
				initialize_loc = BP_HEAD
			if(O_AUG_INPUTPORT)
				I.organ_tag = O_AUG_INPUTPORT
				I.parent_organ = BP_HEAD
				initialize_loc = BP_HEAD
			if(O_AUG_BODY)
				I.organ_tag = O_AUG_BODY
				I.parent_organ = BP_TORSO
			if(O_AUG_EYES)
				I.organ_tag = O_AUG_EYES
				I.parent_organ = BP_HEAD
				I.target_slot = slot_glasses
				initialize_loc = BP_HEAD
		. = H.get_organ(I.parent_organ)

//////////////////////////
//BODY AUGMENTS
//////////////////////////

/obj/item/weapon/augment/body/dermalplate
	name = "ares sub-dermal plating"
	desc = "An augment that weaves itself into the dermis, increasing damage resistance."
	icon_state = "augment_plating"
	organ_to_implant = /obj/item/organ/internal/augment/body/dermalplate
	organ_display_name = "ares sub-dermal plating"
	possible_targets = list(O_AUG_BODY)

/obj/item/weapon/augment/body/hyperreflex
	name = "kiroshi hyper-reflex repeater"
	desc = "An augment that speeds up synaptic communication, increasing a subject's reflexes."
	icon_state = "augment_reflex"
	organ_to_implant = /obj/item/organ/internal/augment/spinal/hyperreflex
	organ_display_name = "kiroshi hyper-reflex repeater"
	possible_targets = list(O_AUG_SPINE)

//////////////////////////
//LIMB AUGMENTS
//////////////////////////

/obj/item/weapon/augment/limb/laser
	name = "laser cannon augment"
	desc = "A large augment designed to deploy a laser emitting array from a cybernetic arm."
	icon_state = "augment_laser"
	organ_to_implant = /obj/item/organ/internal/augment/arms/laser
	organ_display_name = "laser cannon augment"
	possible_targets = list(O_AUG_R_FOREARM,O_AUG_L_FOREARM)

/obj/item/weapon/augment/limb/laser/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> A40C Integrated Laser-emitting Array<BR>
<b>Life:</b> 1 year.<BR>
<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to deploy a powerful laser-emitting array from their arm.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> Cybernetic Limbs Only"}
	return dat

/obj/item/weapon/augment/limb/tesla
	name = "tesla array augment"
	desc = "A large augment designed to deploy a powerful tesla array from a cybernetic arm."
	icon_state = "augment_tesla"
	organ_to_implant = /obj/item/organ/internal/augment/arms/tesla
	organ_display_name = "tesla array augment"
	possible_targets = list(O_AUG_R_FOREARM,O_AUG_L_FOREARM)

/obj/item/weapon/augment/limb/tesla/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> EG76 Integrated Tesla Array<BR>
<b>Life:</b> 3 months. <BR>
<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to deploy a powerful tesla array from their arm.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> <font color='red'>Cybernetic Limbs Only</font>"}
	return dat

/obj/item/weapon/augment/limb/superjump
	name = "hip extensor augment"
	desc = "A medium sized augment designed to overclock synthetic hip extensor muscle fibers."
	icon_state = "augment_jump"
	organ_to_implant = /obj/item/organ/internal/augment/pelvic/superjump
	organ_display_name = "hip extensor augment"
	possible_targets = list(O_AUG_PELVIC)

/obj/item/weapon/augment/limb/superjump/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> P0J Hip Extensor Augment<BR>
<b>Life:</b> 8 months. <BR>
<b>Important Notes:</b> <font color='green'>Legal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to leap extreme distances in a single bound.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> Organic Limbs, Cybernetic Limbs"}
	return dat
//////////////////////////
//HAND AUGMENTS
//////////////////////////

/obj/item/weapon/augment/limb/dart
	name = "dart launcher augment"
	desc = "A small augment that deploys a dart launcher from the wrist of a cybernetic arm."
	icon_state = "augment_dart"
	organ_to_implant = /obj/item/organ/internal/augment/hands/dart
	organ_display_name = "integrated dart launcher"
	possible_targets = list(O_AUG_R_HAND, O_AUG_L_HAND)

/obj/item/weapon/augment/limb/dart/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> Redsun Integrated Dart Launcher<BR>
<b>Life:</b> 6 months. <BR>
<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to deploy an inconspicuous dart launcher from their wrist.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> <font color='red'>Cybernetic Limbs Only</font>"}
	return dat

/obj/item/weapon/augment/limb/lighter
	name = "lighter augment"
	desc = "A small augment that deploys a lighter from the finger of a cybernetic hand."
	icon_state = "augment_lighter"
	organ_to_implant = /obj/item/organ/internal/augment/hands/lighter
	organ_display_name = "integrated finger lighter"
	possible_targets = list(O_AUG_R_HAND, O_AUG_L_HAND)

/obj/item/weapon/augment/limb/tesla/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> DromedaryCo. Finger Lighter<BR>
<b>Life:</b> Indefinitely with proper maintenance. <BR>
<b>Important Notes:</b> <font color='green'>Legal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to deploy a lighter from their finger.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> <font color='red'>Cybernetic Limbs Only</font>"}
	return dat

/obj/item/weapon/augment/limb/datajack
	name = "datajack augment"
	desc = "A tiny augment that deploys from the wrist, allowing the user to interface with compatible hardware."
	icon_state = "augment_datajack"
	organ_to_implant = /obj/item/organ/internal/augment/hands/datajack
	organ_display_name = "datajack"
	possible_targets = list(O_AUG_DATAJACK)

/obj/item/weapon/augment/limb/datajack/get_data()
	var/dat = {"
<b>Augment Specifications:</b><BR>
<b>Name:</b> Universal Augment Datajack<BR>
<b>Life:</b> Indefinitely with proper maintenance. <BR>
<b>Important Notes:</b> <font color='green'>Legal</font><BR>
<HR>
<b>Implant Details:</b> Subjects augmented with this device will be able to deploy a datajack from their wrist, allowing for interfacing with compatible hardware.<BR>
<b>Integrity:</b> Augment is susceptible to electromagnetic pulses.<BR>
<b>Suitable Subjects:</b> Organic Limbs, Cybernetic Limbs"}
	return dat

//////////////////////////
//MISC AUGMENTS
//////////////////////////

/obj/item/weapon/augment/rebreather
	name = "rebreather augment"
	desc = "A small augment designed to enable a subject to breathe underwater."
	icon_state = "augment_rebreather"
	organ_to_implant = /obj/item/organ/internal/augment/rebreather
	organ_display_name = "rebreather augment"
	possible_targets = list(O_AUG_RIBS)

/obj/item/weapon/augment/mirrorshades
	name = "mirrorshades augment"
	desc = "A small augment that adds a pair of retractable polarized lenses to a subject's head."
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "jensenshades"
	organ_to_implant = /obj/item/organ/internal/augment/mirrorshades
	organ_display_name = "mirrorshades augment"
	possible_targets = list(O_AUG_EYES)

/obj/item/weapon/augment/inputport
	name = "input port augment"
	desc = "A tiny augment that allows for interfacing and rapid scans of a subject's body."
	icon_state = "augment_box"
	organ_to_implant = /obj/item/organ/internal/augment/inputport
	organ_display_name = "input port"
	possible_targets = list(O_AUG_INPUTPORT)

/