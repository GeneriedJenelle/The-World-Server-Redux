/datum/job/hos
	title = "Chief of Police"
	flag = HOS
	head_position = 1
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the city council"
	selection_color = "#8E2929"
	idtype = /obj/item/weapon/card/id/security/head
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_morgue,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_morgue,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimum_character_age = 25
	minimal_player_age = 14

	outfit_type = /decl/hierarchy/outfit/job/security/hos
	alt_titles = list("Security Commander", "Chief of Security")

/datum/job/warden
	title = "Prison Warden"
	flag = WARDEN
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief of police"
	selection_color = "#601C1C"
	idtype = /obj/item/weapon/card/id/security/warden
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 5
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/security/warden
	alt_titles = list("Correctional Officer")

/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief of police"
	selection_color = "#601C1C"
	idtype = /obj/item/weapon/card/id/security/detective
	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_eva, access_external_airlocks)
	minimal_access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_eva, access_external_airlocks)
	economic_modifier = 5
	minimal_player_age = 3
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/security/detective
	alt_titles = list("Forensic Technician" = /decl/hierarchy/outfit/job/security/detective/forensic, "Investigator")

/datum/job/officer
	title = "Police Officer"
	flag = OFFICER
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 10
	spawn_positions = 16
	supervisors = "the chief of police"
	selection_color = "#601C1C"
	idtype = /obj/item/weapon/card/id/security/officer
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 3
	minimum_character_age = 18
	outfit_type = /decl/hierarchy/outfit/job/security/officer
	alt_titles = list("Junior Officer","Traffic Warden" = /decl/hierarchy/outfit/job/security/traffic)

/datum/job/prosecutor
	title = "District Prosecutor"
	flag = PROSECUTOR
	department = "Security"
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the mayor and the city council"
	selection_color = "#601C1C"
	idtype = /obj/item/weapon/card/id/security/prosecutor
	economic_modifier = 7
	access = list(access_prosecutor, access_sec_doors, access_maint_tunnels, access_heads)
	minimal_access = list(access_prosecutor, access_sec_doors, access_heads)
	minimal_player_age = 7
	minimum_character_age = 20
	alt_titles = list("Prosecution Officer","District Attorney")

	outfit_type = /decl/hierarchy/outfit/job/prosecution