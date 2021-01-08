

/datum/persistent_option/toggle/rights/voting
	var_to_edit = "toggle_status"
	make_referendum = TRUE
	toggle_status = TRUE
	portal_category = "Voting Rights"

// Voting Rights

/datum/persistent_option/toggle/rights/voting/noncitizen
	name = "Non-Citizen Voting Rights"
	description = "Can people with non-Polluxian nationality vote?"
	id = "voting_noncitizen"

/datum/persistent_option/toggle/rights/voting/synthetic
	name = "Synthetic Voting Rights"
	description = "Can synthetics vote?"
	id = "voting_synthetic"

/datum/persistent_option/toggle/rights/voting/mpvatborn
	name = "Mass-Produced Vatborn Voting Rights"
	description = "Can mass produced vatborn vote?"
	id = "voting_mpvatborn"

/datum/persistent_option/toggle/rights/voting/baseline
	name = "Baseline Vatborn Voting Rights"
	description = "Can baseline vatborn vote?"
	id = "voting_bvatborn"

/datum/persistent_option/toggle/rights/voting/excon
	name = "Ex-Convict Voting Rights"
	description = "Can the formerly convicted vote?"
	id = "voting_excon"

// Minimum Ages

/datum/persistent_option/number_value/minimum_age
	min_value = 13
	max_value = 80
	value = 18
	var_to_edit = "value"
	portal_category = "Minimum Ages"

/datum/persistent_option/number_value/minimum_age/voting
	name = "Voting Age"
	description = "Change the minimum voting age."
	id = "voting_gambling"

/datum/persistent_option/number_value/minimum_age/drinking
	name = "Minimum Drinking Age"
	description = "Change the minimum drinking age."
	id = "min_age_drinking"

/datum/persistent_option/number_value/minimum_age/smoking
	name = "Minimum Smoking and Tobacco Usage Age"
	description = "Change the minimum smoking age."
	id = "min_age_smoking"

/datum/persistent_option/number_value/minimum_age/gambling
	name = "Minimum Gambling Age"
	description = "Change the minimum gambling age."
	id = "min_age_gambling"

/datum/persistent_option/number_value/minimum_age/weaponry
	name = "Minimum Weapon Permit Age"
	description = "Minimum age someone has to be to own a weapon permit."
	id = "min_age_weaponry"

/datum/persistent_option/number_value/minimum_age/sentencing
	name = "Minimum Sentencing Age"
	description = "Change the minimum age a person can be charged with a crime and convicted."
	id = "min_age_sentencing"

// Discrimination

/datum/persistent_option/toggle/discrimination


/datum/persistent_option/toggle/discrimination/synth
	name = "Synth Discrimination"
	description = "Change the minimum age a person can be charged with a crime and convicted."
	id = "min_age_sentencing"