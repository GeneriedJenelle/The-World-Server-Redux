/decl/hierarchy/outfit/job/security
	hierarchy_type = /decl/hierarchy/outfit/job/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack = /obj/item/weapon/storage/backpack/security
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sec
	backpack_contents = list(/obj/item/weapon/handcuffs = 1)
	r_pocket = /obj/item/device/communicator
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sec

/decl/hierarchy/outfit/job/security/hos
	name = OUTFIT_JOB_NAME("Chief of Police")
	l_ear = /obj/item/device/radio/headset/headset_sec
	uniform = /obj/item/clothing/under/rank/head_of_security
	id_type = /obj/item/weapon/card/id/security/head
	r_pocket = /obj/item/device/communicator
	pda_type = /obj/item/device/pda/heads/hos

/decl/hierarchy/outfit/job/security/warden
	name = OUTFIT_JOB_NAME("Prison Warden")
	uniform = /obj/item/clothing/under/rank/warden
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/device/communicator
	id_type = /obj/item/weapon/card/id/security/warden
	pda_type = /obj/item/device/pda/warden

/decl/hierarchy/outfit/job/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench
	l_pocket = /obj/item/weapon/flame/lighter/zippo
	r_pocket = /obj/item/device/communicator
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/weapon/storage/briefcase/crimekit
	id_type = /obj/item/weapon/card/id/security/detective
	pda_type = /obj/item/device/pda/detective
	backpack = /obj/item/weapon/storage/backpack
	satchel_one = /obj/item/weapon/storage/backpack/satchel/norm
	backpack_contents = list(/obj/item/weapon/storage/box/evidence = 1)

/decl/hierarchy/outfit/job/security/detective/forensic
	name = OUTFIT_JOB_NAME("Forensic technician")
	head = null
	r_pocket = /obj/item/device/communicator
	suit = /obj/item/clothing/suit/storage/forensics/blue

/decl/hierarchy/outfit/job/security/officer
	name = OUTFIT_JOB_NAME("Police Officer")
	uniform = /obj/item/clothing/under/rank/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/device/communicator
	id_type = /obj/item/weapon/card/id/security/officer
	pda_type = /obj/item/device/pda/security

/decl/hierarchy/outfit/job/security/traffic
	name = OUTFIT_JOB_NAME("Traffic Warden")
	uniform = /obj/item/clothing/under/rank/security/traffic
	l_ear = /obj/item/device/radio/headset/headset_sec
	suit = /obj/item/clothing/suit/storage/toggle/marshal_jacket
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/device/communicator
	id_type = /obj/item/weapon/card/id/security/officer
	pda_type = /obj/item/device/pda/security
	backpack_contents = list(/obj/item/device/camera = 1)

