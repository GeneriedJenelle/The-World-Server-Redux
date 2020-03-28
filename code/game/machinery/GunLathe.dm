/obj/machinery/gunlathe
	name = "gunlathe"
	desc = "It produces gun parts using metal and glass."
	icon_state = "autolathe"
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 2000
	circuit = /obj/item/weapon/circuitboard/gunlathe
	var/datum/category_collection/gunlathe/machine_recipes
	var/list/stored_material =  list(DEFAULT_WALL_MATERIAL = 0, "glass" = 0)
	var/list/storage_capacity = list(DEFAULT_WALL_MATERIAL = 0, "glass" = 0)
	var/datum/category_group/gunlathe/current_category
	var/mat_efficiency = 1
	var/build_time = 50

/obj/machinery/gunlathe/New()
	..()
	component_parts = list()
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/console_screen(src)
	RefreshParts()

/obj/machinery/gunlathe/proc/update_recipe_list()
	if(!machine_recipes)
		if(!gunlathe_recipes)
			gunlathe_recipes = new()
		machine_recipes = gunlathe_recipes
		current_category = machine_recipes.categories[1]

/obj/machinery/gunlathe/interact(mob/user as mob)
	update_recipe_list()
	var/list/dat = list()
	dat += "<center><h1>Autolathe Control Panel</h1><hr/>"
	dat += "<table width = '100%'>"
	var/list/material_top = list("<tr>")
	var/list/material_bottom = list("<tr>")

	for(var/material in stored_material)
		material_top += "<td width = '25%' align = center><b>[material]</b></td>"
		material_bottom += "<td width = '25%' align = center>[stored_material[material]]<b>/[storage_capacity[material]]</b></td>"

	dat += "[material_top.Join()]</tr>[material_bottom.Join()]</tr></table><hr>"
	dat += "<h2>Printable Designs</h2><h3>Showing: <a href='?src=\ref[src];change_category=1'>[current_category]</a>.</h3></center><table width = '100%'>"

	for(var/datum/category_item/autolathe/R in current_category.items)
		var/can_make = 1
		var/list/material_string = list()
		var/list/multiplier_string = list()
		var/max_sheets
		var/comma
		if(!R.resources || !R.resources.len)
			material_string += "No resources required.</td>"
		else
			//Make sure it's buildable and list requires resources.
			for(var/material in R.resources)
				var/sheets = round(stored_material[material]/round(R.resources[material]*mat_efficiency))
				if(isnull(max_sheets) || max_sheets > sheets)
					max_sheets = sheets
				if(!isnull(stored_material[material]) && stored_material[material] < round(R.resources[material]*mat_efficiency))
					can_make = 0
				if(!comma)
					comma = 1
				else
					material_string += ", "
				material_string += "[round(R.resources[material] * mat_efficiency)] [material]"
			material_string += ".<br></td>"
			//Build list of multipliers for sheets.
			if(R.is_stack)
				if(max_sheets && max_sheets > 0)
					max_sheets = min(max_sheets, R.max_stack) // Limit to the max allowed by stack type.
					multiplier_string += "<br>"
					for(var/i = 5;i<max_sheets;i*=2) //5,10,20,40...
						multiplier_string  += "<a href='?src=\ref[src];make=\ref[R];multiplier=[i]'>\[x[i]\]</a>"
					multiplier_string += "<a href='?src=\ref[src];make=\ref[R];multiplier=[max_sheets]'>\[x[max_sheets]\]</a>"

		dat += "<tr><td width = 180>[R.hidden ? "<font color = 'red'>*</font>" : ""]<b>[can_make ? "<a href='?src=\ref[src];make=\ref[R];multiplier=1'>" : ""][R.name][can_make ? "</a>" : ""]</b>[R.hidden ? "<font color = 'red'>*</font>" : ""][multiplier_string.Join()]</td><td align = right>[material_string.Join()]</tr>"
		dat += "</table><hr>"

	user << browse(dat.Join(), "window=gunlathe")
	onclose(user, "gunlathe")