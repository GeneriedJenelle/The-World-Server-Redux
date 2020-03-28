var/datum/category_collection/gunlathe/gunlathe_recipes

/datum/category_item/gunlathe/New()
	..()
	var/obj/item/I = new path()
	if(I.matter && !resources)
		resources = list()
		for(var/material in I.matter)
			resources[material] = I.matter[material]*1.25 // More expensive to produce than they are to recycle.
	if(is_stack && istype(I, /obj/item/stack))
		var/obj/item/stack/IS = I
		max_stack = IS.max_amount
	qdel(I)

/****************************
* Category Collection Setup *
****************************/

/datum/category_collection/gunlathe
	category_group_type = /datum/category_group/gunlathe

/*************
* Categories *
*************/

/datum/category_group/gunlathe

/datum/category_group/gunlathe/all
	name = "All"
	category_item_type = /datum/category_item/gunlathe

///datum/category_group/autolathe/all/New()

/datum/category_group/gunlathe/upreciever
	name = "Upper Recievers"
	category_item_type = /datum/category_group/gunlathe/upreciever

/*******************
* Category entries *
*******************/

/datum/category_item/gunlathe
	var/path
	var/list/resources
	var/hidden
	var/power_use = 0
	var/is_stack
	var/max_stack

/datum/category_item/gunlathe/dd_SortValue()
	return name