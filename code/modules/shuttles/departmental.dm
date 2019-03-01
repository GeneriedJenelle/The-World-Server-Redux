/obj/machinery/computer/shuttle_control/mining
	name = "mining shuttle control console"
	shuttle_tag = "Mining"
	//req_access = list(access_mining)
	circuit = /obj/item/weapon/circuitboard/mining_shuttle

/obj/machinery/computer/shuttle_control/engineering
	name = "engineering shuttle control console"
	shuttle_tag = "Engineering"
	//req_one_access = list(access_engine_equip,access_atmospherics)
	circuit = /obj/item/weapon/circuitboard/engineering_shuttle

/datum/shuttle/ferry/research
	name = "Research"
	location = 0
	area_offsite = /area/shuttle/research/outpost
	area_station = /area/shuttle/research/station

/obj/machinery/computer/shuttle_control/research
	name = "research shuttle console"
	icon = 'icons/obj/computer.dmi'
	icon_state = "shuttle"
	shuttle_tag = "Research"
	req_access = list(access_research)
