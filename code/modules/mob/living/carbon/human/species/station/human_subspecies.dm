

/*
/datum/species/human/gravworlder
	name = "grav-adapted Human"
	name_plural = "grav-adapted Humans"
	blurb = "Heavier and stronger than a baseline human, gravity-adapted people have \
	thick radiation-resistant skin with a high lead content, denser bones, and recessed \
	eyes beneath a prominent brow in order to shield them from the glare of a dangerously \
	bright, alien sun. This comes at the cost of mobility, flexibility, and increased \
	oxygen requirements to support their robust metabolism."
	icobase = 'icons/mob/human_races/subspecies/r_gravworlder.dmi'

	flash_mod =     0.9
	oxy_mod =       1.1
	radiation_mod = 0.5
	brute_mod =     0.85
	slowdown =      1



/datum/species/human/spacer
	name = "space-adapted Human"
	name_plural = "space-adapted Humans"
	blurb = "Lithe and frail, these sickly folk were engineered for work in environments that \
	lack both light and atmosphere. As such, they're quite resistant to asphyxiation as well as \
	toxins, but they suffer from weakened bone structure and a marked vulnerability to bright lights."
	icobase = 'icons/mob/human_races/subspecies/r_spacer.dmi'

	oxy_mod =   0.8
	toxins_mod =   0.9
	flash_mod = 1.2
	brute_mod = 1.1
	burn_mod =  1.1
*/

/datum/species/human/vatgrown
	name = SPECIES_HUMAN_VATBORN
	name_plural = "Baseline Vatborn"
	blurb = "With cloning on the forefront of human scientific advancement, cheap mass production \
	of bodies is a very real and rather ethically grey industry. Vat-grown or Vatborn humans tend to be \
	paler than baseline, with no appendix and fewer inherited genetic disabilities, but a more aggressive metabolism."
	icobase = 'icons/mob/human_races/subspecies/r_vatgrown.dmi'

	toxins_mod =   1.1
	metabolic_rate = 1.15
	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_LUNGS =    /obj/item/organ/internal/lungs,
		O_LIVER =    /obj/item/organ/internal/liver,
		O_VOICE =    /obj/item/organ/internal/voicebox,
		O_KIDNEYS =  /obj/item/organ/internal/kidneys,
		O_BRAIN = 	 /obj/item/organ/internal/brain,
		O_SPLEEN =   /obj/item/organ/internal/spleen/minor,
		O_EYES =     /obj/item/organ/internal/eyes,
		O_STOMACH =	 /obj/item/organ/internal/stomach,
		O_INTESTINE =/obj/item/organ/internal/intestine
		)

	portal_vote_id = "voting_bvatborn"

/datum/species/human/vatgrown/mpl
	name = SPECIES_HUMAN_VATBORN_MPL
	name_plural = "Mass-Produced Vatborn"
	blurb = "Vat-grown or Vatborn humans tend to be paler than baseline, with no appendix and fewer inherited genetic \
	disabilities, but a more aggressive metabolism. Mass-Produced Vatborn differ from other Vatborn in that they have \
	a cortical stack implanted in the nape of their neck that serves to store the sum total of their experience and \
	memories. Mass-Produced Vatborn tend to lack the full set of social skills that other Vatborn develop due to their existence \
	as tools, rather than people. Their biological ages often differ from their actual age and it is common to see Mass-Produced Vatborn \
	as young as 2 years old working in positions often relegated to humans with several years of experience. <br><br> \
	And lo, did humans cross the boundary and manufacture their own people, to do the menial, tedious work no-one wished to do. \
	Impressed with false memories and even false dreams to keep them placid, these creatures are considered with the disdain and disgust of Frankenstein's monster; <br>\
	With all the importance of a roomba. It is best not to entertain their delusions."

	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_LUNGS =    /obj/item/organ/internal/lungs,
		O_LIVER =    /obj/item/organ/internal/liver,
		O_VOICE =    /obj/item/organ/internal/voicebox,
		O_KIDNEYS =  /obj/item/organ/internal/kidneys,
		O_FAKEBRAIN = /obj/item/organ/internal/fake_brain,
		O_STACK =    /obj/item/organ/internal/brain/vatborn,
		O_SPLEEN =   /obj/item/organ/internal/spleen/minor,
		O_EYES =     /obj/item/organ/internal/eyes,
		O_STOMACH =	 /obj/item/organ/internal/stomach,
		O_INTESTINE =/obj/item/organ/internal/intestine
		)

	portal_vote_id = "voting_mpvatborn"
/*
// These guys are going to need full resprites of all the suits/etc so I'm going to
// define them and commit the sprites, but leave the clothing for another day.
/datum/species/human/chimpanzee
	name = "uplifted Chimpanzee"
	name_plural = "uplifted Chimpanzees"
	blurb = "Ook ook."
	icobase = 'icons/mob/human_races/subspecies/r_upliftedchimp.dmi'
*/

