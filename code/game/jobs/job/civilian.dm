//Food
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/bartender
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar)
	minimum_character_age = 18

	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	alt_titles = list("Waiting Staff","Barkeep","Mixologist","Barista" = /decl/hierarchy/outfit/job/service/bartender/barista)


/datum/job/chef
	title = "Chef"
	flag = CHEF
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/chef
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_kitchen)
	minimum_character_age = 18

	outfit_type = /decl/hierarchy/outfit/job/service/chef
	alt_titles = list("Cook","Restaurant Host")

/datum/job/hydro
	title = "Grocer"
	flag = BOTANIST
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/botanist
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_hydroponics)
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	alt_titles = list("Botanist", "Hydroponicist", "Gardener","Farmer")

//Cargo
/datum/job/qm
	title = "Operations Manager"
	flag = QUARTERMASTER
	department = "Cargo"
	head_position = 1
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the city council"
	selection_color = "#7a4f33"
	idtype = /obj/item/weapon/card/id/cargo/head
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimum_character_age = 20
	ideal_character_age = 35

	outfit_type = /decl/hierarchy/outfit/job/cargo/qm
	alt_titles = list("Supply Chief")

/datum/job/cargo_tech
	title = "Distribution Service Officer"
	flag = CARGOTECH
	department = "Cargo"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the operations manager"
	selection_color = "#9b633e"
	idtype = /obj/item/weapon/card/id/cargo/cargo_tech
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech
	alt_titles = list("Delivery Assistant")

//Service
/datum/job/librarian
	title = "Librarian"
	flag = LIBRARIAN
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the ministry of culture and heritage"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/librarian
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)

	outfit_type = /decl/hierarchy/outfit/job/librarian
	alt_titles = list("Historian", "Tour Guide", "Curator")

/datum/job/journalist
	title = "Journalist"
	flag = JOURNALIST
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/journalist
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)

	outfit_type = /decl/hierarchy/outfit/job/journalist
	alt_titles = list("Reporter", "Writer")

//var/global/lawyer = 0//Checks for another lawyer //This changed clothes on 2nd lawyer, both IA get the same dreds.
/datum/job/defense
	title = "Defense Attorney"
	flag = LAWYER
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/defense
	economic_modifier = 7
	access = list(access_lawyer, access_sec_doors, access_maint_tunnels, access_heads)
	minimal_access = list(access_lawyer, access_sec_doors, access_heads)
	minimal_player_age = 7
	minimum_character_age = 20
	alt_titles = list("Defense Lawyer","Defense Attorney","Barrister")

	outfit_type = /decl/hierarchy/outfit/job/defense

/datum/job/judge
	title = "Judge"
	flag = JUDGE
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Pollux Law"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/judge
	economic_modifier = 13
	access = list(access_judge, access_sec_doors, access_maint_tunnels, access_heads)
	minimal_access = list(access_judge, access_sec_doors, access_heads)
	minimal_player_age = 7
	minimum_character_age = 25
	alt_titles = list("Magistrate")

	outfit_type = /decl/hierarchy/outfit/job/judge


/*
/datum/job/lawyer/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
*/

/datum/job/barber
	title = "Barber"
	flag = BARBER
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "yourself"
	selection_color = "#515151"
	idtype = /obj/item/weapon/card/id/civilian/barber
	minimum_character_age = 18
	access = list(access_barber, access_maint_tunnels)
	minimal_access = list(access_barber)
	outfit_type = /decl/hierarchy/outfit/job/barber
	alt_titles = list("Hairdresser", "Stylist", "Beautician")