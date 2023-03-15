*** Settings ***
Documentation   Assists users in quickly filling out and verifying their PTR time cards
...   This script removes a lot of clicking and typing, but is still an interactive process.
...   The script assumes a baseline of 40 hours, and will pause at each form to let you input corrected numbers for any time off. 
...
...   Windows users must do the following to setup:
...   Install Chocolatey package manager
...   Install Python3, be sure to include tk / tkinter libraries
...   Choose the option in the MSI installer for Windows.
...   On mac, brew install python-tk
...   
...   One time setup as admin:
...   pip install robotframework
...   pip install --upgrade robotframework-seleniumlibrary
...   choco install chromedriver  # Windows
...   brew install chromedriver  # Mac
...
...   Occasionally update (as admin):
...   choco update chromedriver  # Windows
...   brew upgrade chromedriver  # Mac
...
...   To report time (not as admin):
...   robot ./ReportTime.robot

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

User is logged in to PTR
  Open Browser      ${PTRURL}   ${BROWSER} 
  Execute Manual Step   Please Login and then press Pass
  Page should contain               Welcome

User fills in all overdue time cards
  Repeat Keyword    12 times      Fill Overdue Form Only If Needed
  Page Should Contain     No overdue time reports

User fills in latest time card
  Run Keyword                       Fill In Form

PTR shows user is up to date
  Take Screenshot
  Page Should Contain     No overdue time reports
  Maximize Browser Window
  Execute javascript  document.body.style.zoom="70%"

*** Test Cases ***

User gets PTR up to date by filling in any cards

  Given user is logged in to PTR
  When user fills in all overdue time cards
  And user fills in latest time card
  Then PTR shows user is up to date
