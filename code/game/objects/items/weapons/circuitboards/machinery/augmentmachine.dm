#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/augmentmachine
	name = T_BOARD("augmentation chamber")
	build_path = /obj/machinery/augmentmachine
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 5, TECH_BIO = 5, TECH_BLUESPACE = 2)
	req_components = list(
							/obj/item/stack/cable_coil = 5,
							/obj/item/weapon/stock_parts/capacitor = 2,
							/obj/item/weapon/stock_parts/manipulator = 4,
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/micro_laser = 3,
							/obj/item/weapon/stock_parts/matter_bin = 1)