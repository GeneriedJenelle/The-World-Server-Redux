/obj/item/organ/internal/augment/body/dermalplate
	name = "ares sub-dermal plating"
	desc = "Flexible kevlar plating designed to be woven into the dermis."
	icon_state = "augment_plating"
	w_class = ITEMSIZE_LARGE
	organ_tag = O_AUG_BODY
	parent_organ = BP_TORSO
	target_parent_classes = list(ORGAN_FLESH, ORGAN_ASSISTED, ORGAN_ROBOT, ORGAN_LIFELIKE)

/obj/item/organ/internal/augment/body/dermalplate/augment_action()
	if(!owner)
		return

	if(istype(owner, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = owner
		H.add_modifier(/datum/modifier/dermalplate, 3 MINUTES)