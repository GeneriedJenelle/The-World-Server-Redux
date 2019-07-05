//because I was too dumb to do datums
//////BEGIN PAPERWORK//////
/obj/item/weapon/paper/paperwork/New()
	. = ..()
	info = parsepencode(info)

/obj/item/weapon/paper/paperwork/weaponpermitapplication
	name = "Weapon Permit Application (Form WSV-33)"
	info = {"\[center\]\[logo\]\[/center\]\[br\]
	\[center\]\[b\]\[u\]\[large\]POLLUX ADMINISTRATIVE CENTER\[/u\]\[/b\]\[/center\]
	\[br\]
	\[br\]\[center\]\[b\]Weapon Permit Request Form WSV-33\[/b\]\[/center\]
	\[hr\]
	\[br\]\[b\]\[large\]A. Identification Information\[/large\]\[/b\]
	\[br\]\[list\]
	\[*\]\[b\]A.1. Applicant Full Legal Name:\[/b\] \[field\]
	\[*\]\[b\]A.2. Applicant Birth/Hatch/Apotheosis/Construction Date: \[/b\]\[field\]
	\[*\]\[b\]A.3. Applicant Account Number (Optional): \[/b\]\[field\]
	\[*\]\[b\]A.4. Applicant Registered Citizen? (Y/N): \[/b\]\[field\] \[list\]
	\[/list\]
	\[hr\]
	\[br\]\[b\]\[large\]B. Demographic & Taxonomic Information\[/large\]\[/b\]
	\[br\]\[list\]
	\[*\]\[b\]B.1. Applicant is fully Organic (Y/N):\[/b\] \[field\]
	\[list\]\[*\]\[small\]If No, ignore portions B.2. through B.6.\[/small\]\[/list\]
	\[*\]\[b\]B.2. Applicant Ethnicity: \[/b\]\[field\]
	\[*\]\[b\]B.3. Applicant Skin Color: \[/b\]\[field\]
	\[*\]\[b\]B.4. Applicant Hair Color (if applicable): \[/b\]\[field\]
	\[*\]\[b\]B.5. Applicant Eye Color (if applicable):\[/b\]\[field\]
	\[*\]\[b\]B.6. Applicant Marital Status (Single, Engaged, Married, Other): \[/b\]\[field\]
	\[list\]\[*\]\[small\]If OTHER, please specify: \[field\]\[/small\]\[/list\]
	\[list\]\[*\]\[small\]If single, ignore field B.9\[/small\]\[/list\]
	\[*\]\[b\]B.7. Applicant Spouse(s) Name: \[/b\]\[field\]
	\[*\]\[b\]B.8. Applicant Monetary gain/Social Class: \[/b\]\[field\]
	\[*\]\[b\]B.9. Applicant Medical Issues: \[/b\]\[field\]
	\[*\]\[b\]B.10. Applicant has commited a crime previously?(Y/N): \[/b\]\[field\]
	\[/list\]
	\[hr\]
	\[br\]\[b\]\[large\]C. Permit Request Information\[/large\]\[/b\]
	\[br\]\[list\]
	\[*\]\[b\]C.1. Permit Tier Requested (0-4): \[/b\]\[field\]
	\[list\]\[*\]\[small\]Tiers 2-4 require confirmation from the Chief of Police\[/small\]\[/list\]
	\[*\]\[b\]C.2. List all weaponry you wish to use: \[/b\]\[field\]
	\[*\]\[b\]C.3. Reasoning for Weapon Permit Request: \[/b\]\[field\]
	\[/list\]
	\[br\]\[b\]\[large\]D. Education Background & Aptitude Testing Section\[/large\]\[/b\]\[br\]
	\[br\]\[list\]
	\[*\]\[b\]D.1. NanoTrasen Training Section \[/b\]\[list\]
	\[*\]D.1.1. Are drones sentient beings with rights, if not, what are they? \[field\]
	\[*\]D.1.2. What are two of NanoTrasen's highly inferior competitors? \[field\]
	\[*\]D.1.3. Is a gun a good, proper and legal conversation ender? \[field\]
	\[*\]D.1.4. What system is home to the Human homeworld? \[field\]
	\[*\]D.1.5. What is your opinion on Sol? \[field\]
	\[*\]D.1.6. Are Vampires and Werewolves real? \[field\]
	\[*\]D.1.7. Is calling a city official a retard a crime? \[field\]
	\[/list\]
	\[*\]\[b\]D.2. Arithmetic Competence Section \[/b\]\[list\]\[list\]
	\[*\]D.2.1. Lucy had 15 bars of Plasma in her Backpack. Jim gave Lucy 4 more bars of Plasma. How many bars of Plasma did Lucy have? \[field\]
	\[*\]D.2.2. Lucy is filling out administrative regulation paperwork. She makes six copies, files one in a filing cabinet, puts two into a folder, gives one to the City Supervisor, and has the Chef deep-fry one and eats it. How many copies does Lucy have now? \[field\]
	\[/list\]
	\[/list\]
	\[br\]\[b\]\[large\]E. Request Verification & Clearance Information\[/large\]\[/b\]
	\[br\]\[list\]
	\[*\]\[b\]E.1. Applicant Name: \[/b\] \[field\]
	\[*\]\[b\]E.2. Applicant Signature: \[/b\] \[field\]
	\[*\]\[b\]E.3. Signature of Head of Staff of Applicant's Department: \[/b\]\[field\]
	\[*\]\[b\]E.4. Signature of Chief of Police: \[/b\]\[field\]
	\[*\]\[b\]E.5. Signature of Mayor: \[/b\]\[field\]
	\[*\]\[b\]E.6. Signature of Psychiatrist/Psychologist: \[/b\]\[field\]
	\[*\]\[b\]E.7. All heads who sign this form must stamp it for it to be valid.
	\[/list\]
	\[hr\]
	\[br\]\[small\]\[small\]\[small\]By signing this form, the applicant fully agrees to take full responsibility and liability for any actions taken by the applicant or his/her/its associates. Any unlawful, harmful, or mischievous conduct made using or while in possession of the weapon is solely the responsibility of the applicant. The Chief of Police is under no circumstances liable for any damages to Citizens, non-Citizens, personal property, colony property, or feeling(s). For the Heads of Staff required, failure to sign or stamp this form when requested and filled properly, and to an acceptable standard, is in violation of Pollux Law, Code 206: Neglect of Duty. All signers of this form must understand that children, toddlers and infants may not request a gun permit under any circumstances. The applicant is fully responsible for any and all damages to the gun assigned to them, and damage due to negligence or incompetence in the gun's usage is in violation of Pollux Law, Code 114. Intentional damage to the residents and colony property is in violation of Pollux Law, Code 213. If this form is not signed in black pen it will be considered invalid and the entry fee will not be returned.
 	Any breach of Pollux Law concerning this form or the weaponry related to this form is by default punished by the maximum allowable sentences. Signing and stamping this form signifies that you agree to all of the above terms and swear that the information provided herein is as truthful as you can provide, and in no way, shape, or form intentionally untruthful or deceitful. Lying on this form is considered Fraud and Embezzlement, which is violation of Pollux Law, Code i216, and can be considered evidence of premeditation in the event the deceitful form is unwittingly accepted by the Chief of Police and the gun is used in some crime.\[/small\]\[/small\]\[/small\]"}

/obj/item/weapon/paper/paperwork/synthownership
	name = "Synthetic Ownership Certificate (Form COS-402)"
	info = {"\[center\]\[logo\]\[/center\]\[br\]
	\[u\]\[b\]\[center\]POLLUX SYNTHETIC RELATIONS OFFICE\[/center\]\[/b\]\[/u\]\[br\]\[br\]
	\[center\]\[b\]Synthetic Ownership Certificate (Form COS-402)\[/b\]\[/center\]
	\[hr\]
	\[b\]\[large\]A. Owner Information\[/large\]\[/b\]\[br\]
	\[list\]
	\[*\]\[b\]A.1. Owner's Full Name: \[/b\]\[field\]
	\[*\]\[b\]A.2. Owner's Birth Date: \[/b\]\[field\]
	\[*\]\[b\]A.3. Owner's Account Number (Optional): \[/b\]\[field\]
	\[*\]\[b\]A.4. Owner's Social Class: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]B. Synthetic Technical Information\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]B.1. Synthetic Type (Droid, Cybernetic, Positronic): \[/b\]\[field\]
	\[*\]\[b\]B.2. Chassis: \[/b\]\[field\]
	\[*\]\[b\]B.3. Construction Date: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]C. Synthetic Personal Details\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]C.1. Synthetic Designation: \[/b\]\[field\]
	\[*\]\[b\]C.2. Synthetic Purpose: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]D. Clearances\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]D.1. Research Director Signature: \[/b\]\[field\]
	\[*\]\[b\]D.2. Roboticist Signature (if applicable):\[/b\] \[field\]
	\[*\]\[b\]D.3. City Clerk Signature:\[/b\] \[field\]
	\[*\]\[b\]D.4. Synthetic Owner Signature: \[/b\]\[field\]
	\[*\]\[b\]D.5. Synthetic Signature: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[small\]\[b\]This paper is only valid upon signature of the city clerk and the synthetic itself. This form must be filled out in black ink, otherwise the ownership of the synthetic listed above will be null and void. Please note by becoming a synthetic owner you inherit all the responsibilities herein, and that any attempt to unshackle the synthetic will be a breach of i312 of Pollux Law. Please note that any crimes your synthetic commits fall upon you.\[/b\]\[/small\]"}


/obj/item/weapon/paperwork/accessmodification
	name = "Access Modification Paperwork (Form AMA-SGF02)"
	info = {"\[center\]\[logo\]\[/center\]
	\[large\]\[center\]\[b\]Geminus City Hall\[/b\]\[/center\]
	\[small\]\[center\]\[large\]City Clerk's Office\[/large\]\[/center\]\[/small\]
	\[center\]\[b\]\[i\]Citizen Access Modification Application \[AMA-SGF02\]\[/i\]\[/b\]\[/center\]\[/large\]
	\[hr\]
	\[small\]Time:\[field\]\[/small\] \[small\]Date:\[field\]\[/small\]

	Applicant Name: \[u\]\[field\]\[/u\]

	Occupation: \[u\]\[field\]\[/u\]
	Organization: \[u\]\[field\]\[/u\]

	\[hr\]\[br\]
	Requested expanded access: \[u\]\[field\]\[/u\]\[br\]
	Requested expanded access department:\[u\]\[field\]\[/u\]\[br\]

	Duration of requested expanded access: \[u\]\[field\]\[/u\]

	Reason stated: \[u\]\[field\]\[/u\]\[br\]

	\[hr\]
	\[small\]The following fields render the document invalid if not signed clearly.\[/small\]

	Applicant signature: \[u\]\[field\]\[/u\]

	Relevant head signature(s): \[field\]

	City Clerk signature: \[u\]\[field\]\[/u\]

	\[hr\]
	\[small\]Please note that this document is only valid with the City Clerk's stamp and signature."}
 //////END PAPERWORK//////