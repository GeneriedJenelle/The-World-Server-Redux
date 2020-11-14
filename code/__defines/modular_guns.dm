#define RECEIVER_SMALL 2
#define RECEIVER_MEDIUM 3
#define RECEIVER_LARGE 4

#define MOD_SILENCE 1
#define MOD_SMART_RELOADER

#define isreceiver(A) istype(A, /obj/item/kinetic_components/capacitor)
#define isbarrel(A) istype(A, /obj/item/kinetic_components/barrel)
#define ismodifier(A) istype(A, /obj/item/kinetic_components/modifier)