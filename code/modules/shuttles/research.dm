/obj/machinery/computer/shuttle_control/research
	name = "research shuttle console"
	icon = 'icons/obj/computer.dmi'
	icon_state = "shuttle"
	shuttle_tag = "Research"
	req_access = list(access_research)
	circuit = "/obj/item/weapon/circuitboard/research_shuttle"


/datum/shuttle/ferry/research
	name = "Research"
	location = 0
	area_offsite = /area/shuttle/research/outpost
	area_station = /area/shuttle/research/station
