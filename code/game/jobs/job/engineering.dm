/datum/job/chief_engineer
	title = "Chief Engineer"
	flag = CHIEF
	head_position = 1
	department = "Engineering"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the city council"
	selection_color = "#7F6E2C"
	idtype = /obj/item/weapon/card/id/engineering/head
	req_admin_notify = 1
	economic_modifier = 10

	minimum_character_age = 25
	ideal_character_age = 50


	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_player_age = 7

	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer

/datum/job/engineer
	title = "City Engineer"
	flag = ENGINEER
	department = "Engineering"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the chief engineer"
	selection_color = "#5B4D20"
	idtype = /obj/item/weapon/card/id/engineering/engineer
	economic_modifier = 5
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_mining, access_mining_station)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_mining, access_mining_station)
	alt_titles = list("Engine Technician","Electrician", "Firefighter", "Drill Technician", "Salvage Technician", "Tunnel Engineer")
	minimum_character_age = 18
	minimal_player_age = 3

	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = "Engineering"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief engineer"
	selection_color = "#5B4D20"
	idtype = /obj/item/weapon/card/id/civilian/janitor
	access = list(access_janitor, access_maint_tunnels)
	minimal_access = list(access_janitor, access_maint_tunnels)
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	alt_titles = list("Custodian", "Sanitation Technician", "Maintanance Technician")