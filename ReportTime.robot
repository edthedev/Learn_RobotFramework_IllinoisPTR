*** Settings ***
Documentation   Let us learn to use this thing.
...   Must do the following to setup:
...   Install Python3, be sure to include tk / tkinter libraries
...   pip install robotframework
...   pip install --upgrade robotframework-seleniumlibrary
...   choco install chromedriver

Library   Dialogs     # Built-in, but requires tkinter as part of Python install.
Library   SeleniumLibrary     # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Variables ***

${BROWSER}  googlechrome
${PTRURL}   https://hrnet.uihr.uillinois.edu/PTRApplication/index.cfm?fuseaction=TimeSheetEntryForm


*** Keywords ***

Fill In Form
  Input Text        mondayTimesheetHourValue    8   clear=false
  Input Text        tuesdayTimesheetHourValue    8   clear=false
  Input Text        wednesdayTimesheetHourValue    8   clear=false
  Input Text        thursdayTimesheetHourValue    8   clear=false
  Input Text        fridayTimesheetHourValue    8   clear=false
  Execute Manual Step   Please Confirm or Correct Values then press Pass
  Click Element    //input[@name="btnSubmit"]
  Page Should contain     You have successfully submitted your time

Fill In Overdue Form
  Wait Until Page Contains Element  id:getPastDueTimeEntryForm
  Click Element                     id:getPastDueTimeEntryForm
  Run Keyword                       Fill In Form

Fill Overdue Form Only If Needed
  ${overdue}=  Run Keyword And Return Status    Element Should Be Visible   id:getPastDueTimeEntryForm
  Run Keyword If    ${overdue}    Fill In Overdue Form

*** Test Cases ***

User can fill in a standard 40 hour time card

  # Get to the page
  Open Browser      ${PTRURL}   ${BROWSER} 
  Execute Manual Step   Please Login and then press Pass
  Page should contain               Welcome
  Page should contain               ${name}

  # Check and fill in for overdue
  Repeat Keyword    12 times      Fill Overdue Form Only If Needed
  Page Should Contain     No overdue time reports

  # Run for today
  Run Keyword                       Fill In Form

User fills in their time card

  Given user is logged in to PTR
  When user fills in all overdue time cards
  And user fills in latest time card
  Then PTR shows user is up to date
