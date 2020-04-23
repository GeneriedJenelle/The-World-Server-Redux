/obj/item/organ/internal/augment/rebreather
	name = "rebreather augment"
	desc = "A rebreather device containing highly pressurized oxygen tanks."
	icon_state = "augment_rebreather"
	organ_tag = O_AUG_RIBS
	parent_organ = BP_TORSO
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)
	aug_cooldown = 1 MINUTES

/obj/item/organ/internal/augment/mirrorshades
	name = "mirrorshade augment"
	desc = "A pair of retractable shades that slot into the skull."
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "mirrorshades"
	organ_tag = O_AUG_EYES
	parent_organ = BP_HEAD
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = /obj/item/clothing/glasses/sunglasses/mirrorshades

/obj/item/organ/internal/augment/inputport
	name = "input port"
	desc = "An input port that allows for rapid scans of a subject's body."
	icon_state = "augment_box"
	organ_tag = O_AUG_INPUTPORT
	parent_organ = BP_HEAD
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = null
	var/shielded = 0

/obj/item/organ/internal/augment/malfunction
	name = "malfunctioning augment"
	desc = "The remains of what was once an augment."
	icon_state = "augment_melted"
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = null

/obj/item/organ/internal/augment/malfunction/augment_action()
	to_chat(usr, pick("<span class='notice'>The augment does not respond.</span>", "<span class='notice'>You cannot communicate with the augment</span>.",
					   "<span class='notice'>The augment is malfunctioning!</span>", "<span class='notice'>The augment does not deploy.</span>"))