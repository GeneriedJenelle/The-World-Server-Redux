// Category defines
#define CAT_GENERAL "General"
#define CAT_MEDICAL "Medical"
#define CAT_LAW "Law"
#define CAT_POLICE "Police"
#define CAT_ENGINEERING "Engineering"
#define CAT_SCIENCE "Science"
#define CAT_COMMAND "Command"

// Paperwork program. Allows the user to upload and download paperwork modules, from a dedicated database table.
/datum/computer_file/program/paperwork
	filename = "paperwork"
	nanomodule_path = /datum/nano_module/paperwork
	filedesc = "Paperwork database mask"
	extended_desc = "Program to interface the paperwork database. Allows the user to download and upload paperwork templates, as TXT files."
	requires_ntnet = TRUE
	size = 6

/datum/nano_module/paperwork
	name = "Paperwork"
	var/selected_category
	var/static/list/all_categories = list(CAT_GENERAL, CAT_MEDICAL, CAT_LAW, CAT_POLICE, CAT_ENGINEERING, CAT_SCIENCE, CAT_COMMAND)

/datum/nano_module/paperwork/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 0, datum/topic_state/state = default_state)
	var/list/data = list()
	if(program)
		data = program.get_header_data()
	establish_db_connection()
	if(!dbcon.IsConnected())
		world << "fuck"
		return
	var/DBQuery/query = dbcon.NewQuery("SELECT * FROM paperwork [selected_category ? "WHERE category='[selected_category]'" : ""]")
	query.Execute()
	data["category"] = list(all_categories)
	var/list/entries = list()
	while(query.NextRow())
		var/list/paperwork_data = list()
		paperwork_data["id"] = query.item[1]
		paperwork_data["title"] = query.item[2]
		paperwork_data["author"] = query.item[4]
		paperwork_data["category"] = query.item[5]
		entries += list(paperwork_data)
	data["paperwork_data"] = entries

	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "paperwork.tmpl", "Paperwork Program", 575, 700, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/paperwork/Topic(href, href_list)
	if(..())
		return
	if(href_list["filter"])
		if(!(href_list["category"] in all_categories))
			return // bad value
		selected_category = selected_category == href_list["category"] ? null : href_list["category"] // Resets filter to null if the user clicks the currently selected category, otherwise sets it to it
		return TRUE
	if(href_list["download"])
		var/id = text2num(href_list["id"]) // if you see this comment do not fucking merge this pr, i need to sanitize this properly for the query to be safe
		if(!id)
			return FALSE
		establish_db_connection()
		if(!dbcon.IsConnected())
			return
		var/DBQuery/query = dbcon.NewQuery("SELECT * FROM paperwork WHERE id='[id]'")
		query.Execute()
		if(query.NextRow()) // id is the primary key, we should only get one result, if we do, let's create a new data file
			var/obj/item/weapon/computer_hardware/hard_drive/HDD = program.computer.hard_drive
			if(!HDD)
				return FALSE
			var/datum/computer_file/data/F = new/datum/computer_file/data()
			F.filename = query.item[2]
			F.filetype = "TXT"
			F.stored_data = query.item[3]
			HDD.store_file(F)
			alert("Download completed.")