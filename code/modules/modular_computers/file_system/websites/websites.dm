//Actual base website definition - a Blank page.

/datum/website
	var/id = "blank" // Must be unique to website!
	var/name = "Blank Page"
	var/title = "Could not connect"
	var/url = "blank.com"
	var/requires_password = FALSE 	//Set this to either true or false.
	var/password = null
	var/web_contents

/datum/website/proc/get_web_header()
	web_contents += "<b>[url]</b><br>"

/datum/website/proc/get_web_content()
	web_contents += "<h1>[name]</h1><hr /><p>Unable to connect to server at <em>www.ntnet.com</em>. Please reload the page or try again later.</p><hr /><sub><em>error ref: 223</em></sub>"

//##### WEBSITES BELOW ####//

//ERROR page. This shows whenever you type in an URL that doesn't exist.

/datum/website/error
	name = "404 Error"
	title = "404 Error - Page not found"
	url = "404.com"


//NTOOGLE.

/datum/website/ntoogle
	name = "NToogle"
	url = "ntgoogle.nt"

/datum/website/ntoogle/get_web_content()
	web_contents += "Welcome to NToogle!"