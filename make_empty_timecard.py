#!/usr/bin/python
"""
Prints a block of past timecard data to paste into `my_timecards.py`.

Modify LAST_CARD_FILLED to the last card filled in,
then run python ./make_empty_timecard.py

Paste the results into `my_timecards.py` and update as needed,
to reflect time spent on University business, before running the robot script.
"""

from datetime import datetime as dt
from datetime import timedelta

text = input('Enter earliest un-filled time card date in format YYYY.DD.MM')

last_card = dt.strptime(text, '%Y.%m.%d')
card = last_card

while card<dt.today():
    pretty_date = card.date().strftime(r'%m/%d/%Y')
    print(f"'{pretty_date}': UNSET,")
    card += timedelta(days=7)