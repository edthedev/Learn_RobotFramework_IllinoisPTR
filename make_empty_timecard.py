"""
Prints a block of past timecard data to paste into `my_timecards.py`.

Modify LAST_CARD_FILLED to the last card filled in,
then run python ./make_empty_timecard.py

Paste the results into `my_timecards.py` and update as needed,
to reflect time spent on University business, before running the robot script.
"""

import datetime
LAST_CARD_FILLED = datetime.datetime(2024,3,17)
foo = LAST_CARD_FILLED

while foo<datetime.datetime.today():
    foo += datetime.timedelta(days=7)
    pretty_date = foo.date().strftime(r'%m/%d/%y')
    print(f"'{pretty_date}': UNSET,")