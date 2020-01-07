/datum/job/business
	title = "Employee"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Business"
	supervisors = "the business owner"
	minimum_character_age = 18
	wage = 10


/datum/job/business/New()
	..()
	business_jobs.Add(src)

/datum/job/business/Destroy()
	..()
	business_jobs.Remove(src)
