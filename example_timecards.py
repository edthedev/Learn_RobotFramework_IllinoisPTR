# TODO: Add your unsubmitted time data below, 
# and rename this file to my_timecards.py

CIVIL_SERVICE_STANDARD = {
		'monday': 7.5, 
		'tuesday': 7.5,
		'wednesday': 7.5, 
		'thursday': 7.5, 
		'friday': 7.5,
}

OUT_OF_OFFICE_ALL_WEEK = {
		'monday': 0, 
		'tuesday': 0,
		'wednesday': 0, 
		'thursday': 0, 
		'friday': 0,
}

MONDAY_OFF = CIVIL_SERVICE_STANDARD.copy()
MONDAY_OFF['monday'] = 0

WED_OFF = CIVIL_SERVICE_STANDARD.copy()
WED_OFF['wednesday'] = 0

FRIDAY_OFF = CIVIL_SERVICE_STANDARD.copy()
FRIDAY_OFF['friday'] = 0

HALF_DAY_FRIDAY = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_FRIDAY['friday'] = 3.75

# The keys in this dictionary should all be a Sunday
# indicating which week to fill in.
TIMECARDS = {
	# Example week with flexible hours
	'05/07/2023': { 
		'monday': 7.75, 
		'tuesday': 7.5,
		'wednesday': 7.25, 
		'thursday': 8, 
		'friday': 7,
	},
	# A week with standard hours
	'05/14/2023': CIVIL_SERVICE_STANDARD,
	# A week of vacation
	'05/21/2023': OUT_OF_OFFICE_ALL_WEEK,
}