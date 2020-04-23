/obj/item/organ/internal/augment/spinal
	name = "spinal augment"
	desc = "An augment that integrates into the spine."
	icon_state = "augment_box"
	w_class = ITEMSIZE_LARGE
	organ_tag = O_AUG_SPINE
	parent_organ = BP_TORSO
	target_slot = slot_l_hand
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)
	integrated_object_type = null

/obj/item/organ/internal/augment/spinal/tail
	name = "tail augment"
	desc = "A prehensile tail augment designed to integrate into the spine."
	icon_state = "augment_box"

/obj/item/organ/internal/augment/spinal/hyperreflex
	name = "hyper-reflex repeater"
	desc = "An augment that accelerates synaptic communication within the body."
	icon_state = "augment_reflex"

/obj/item/organ/internal/augment/spinal/hyperreflex/augment_action()
	if(!owner)
		return

	if(istype(owner, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = owner
		H.add_modifier(/datum/modifier/hyperreflex, 3 MINUTES)