/datum/business
  var/name = "Unnamed Business"
  var/owner_name = "Unknown"
  var/owner_uid = ""                          // owner's unique id
  
  var/category = "General"
  
  var/status = "Active"
  var/list/blacklisted_employees = list()     // by unique id
  
  var/list/datum/job/specific_jobs = list()
  
  var/associated_account_no

  var/gets_business_tax = TRUE                // no one is safe.
