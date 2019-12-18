# pip install robotframework
# pip install --upgrade robotframework-selenium2library
# choco install chromedriver

*** Settings ***

Library   Dialogs     # Built-in, but requires tkinter as part of Python install.
# Library   Screenshot
Library   Selenium2Library
# https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Variables ***
${BROWSER}  googlechrome
${PTRURL}   https://hrnet.uihr.uillinois.edu/PTRApplication/index.cfm?fuseaction=TimeSheetEntryForm

*** Test Cases ***

User can fill in a standard 40 hour time card

  Open Browser    ${PTRURL}   ${BROWSER} 
  Execute Manual Step   Please Login
  # Click Element    xpath=(//div[@class="col-container"])[2]
  Input Text    //input[@name="mondayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[3]
  Input Text    //input[@name="tuesdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[4]
  Input Text    //input[@name="wednesdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[5]
  Input Text    //input[@name="thursdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[6]
  Input Text    //input[@name="fridayTimesheetHourValue"]    8
  # Click Element    //input[@name="btnSubmit"]