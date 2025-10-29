# TODO: Add your unsubmitted time data below, 
# and rename this file to timecards.py

CIVIL_SERVICE_STANDARD = {
		'monday': 7.5, 
		'tuesday': 7.5,
		'wednesday': 7.5, 
		'thursday': 7.5, 
		'friday': 7.5,
}
OUT_ALL_WEEK = {
		'monday': 0,
		'tuesday': 0,
		'wednesday': 0,
		'thursday': 0,
		'friday': 0,
}

STANDARD = CIVIL_SERVICE_STANDARD

MONDAY_OFF = CIVIL_SERVICE_STANDARD.copy()
MONDAY_OFF['monday'] = 0

MONDAY_AND_FRIDAY_OFF = CIVIL_SERVICE_STANDARD.copy()
MONDAY_AND_FRIDAY_OFF['monday'] = 0
MONDAY_AND_FRIDAY_OFF['friday'] = 0

MONDAY_OFF_FRIDAY_HALF = CIVIL_SERVICE_STANDARD.copy()
MONDAY_OFF_FRIDAY_HALF['monday'] = 0
MONDAY_OFF_FRIDAY_HALF['friday'] = 3.75


HALF_DAY_MON = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_MON['monday'] = 3.75

HALF_DAY_MON_AND_TUE = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_MON_AND_TUE['monday'] = 3.75
HALF_DAY_MON_AND_TUE['tuesday'] = 3.75


HALF_DAY_TUE = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_TUE['tuesday'] = 3.75

HALF_DAY_THURS = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_THURS['thursday'] = 3.75

HALF_DAY_FRI = CIVIL_SERVICE_STANDARD.copy()
HALF_DAY_FRI['friday'] = 3.75


OUT_MON = CIVIL_SERVICE_STANDARD.copy()
OUT_MON['monday'] = 0

OUT_TUE = CIVIL_SERVICE_STANDARD.copy()
OUT_TUE['tuesday'] = 0

OUT_TUE_AND_WED = CIVIL_SERVICE_STANDARD.copy()
OUT_TUE_AND_WED['tuesday'] = 0
OUT_TUE_AND_WED['wednesday'] = 0

OUT_WED = CIVIL_SERVICE_STANDARD.copy()
OUT_WED['wednesday'] = 0

OUT_THU = CIVIL_SERVICE_STANDARD.copy()
OUT_THU['thursday'] = 0

OUT_FRI = CIVIL_SERVICE_STANDARD.copy()
OUT_FRI['friday'] = 0

OUT_FRI_HALF = CIVIL_SERVICE_STANDARD.copy()
OUT_FRI_HALF['friday'] = 3.75


OUT_WED_THU = CIVIL_SERVICE_STANDARD.copy()
OUT_WED_THU['wednesday'] = 0
OUT_WED_THU['thursday'] = 0

OUT_THU_FRI = CIVIL_SERVICE_STANDARD.copy()
OUT_THU_FRI['thursday'] = 0
OUT_THU_FRI['friday'] = 0

OUT_MON_TUE_WED = CIVIL_SERVICE_STANDARD.copy()
OUT_MON_TUE_WED['monday'] = 0
OUT_MON_TUE_WED['tuesday'] = 0
OUT_MON_TUE_WED['wednesday'] = 0

IN_MON_TUE = OUT_ALL_WEEK.copy()
IN_MON_TUE['monday'] = 7.5
IN_MON_TUE['tuesday'] = 7.5

WORK_THU_FRI = OUT_ALL_WEEK.copy()
WORK_THU_FRI['thursday'] = 7.5
WORK_THU_FRI['friday'] = 7.5

IN = CIVIL_SERVICE_STANDARD.copy()

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
	'05/21/2023': OUT_ALL_WEEK,
	# Out on Monday
	'05/28/2023': OUT_MON,

}