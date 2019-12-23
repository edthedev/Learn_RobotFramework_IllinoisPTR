*** Settings ***
Documentation   Report time via CA PPM
...   Must do the following to setup:
...   Install Python3, be sure to include tk / tkinter libraries
...   pip install robotframework
...   pip install --upgrade robotframework-seleniumlibrary
...   choco install chromedriver

Library   Dialogs     # Built-in, but requires tkinter as part of Python install.
Library   SeleniumLibrary    

*** Variables ***

${BROWSER}      googlechrome
${WELCOMEURL}   http://go.illinois.edu/techservtimeentry
${PROJECT}  IT  Risk Management
${IDENTIFIER}   class=actuals-input form-control ng-valid ng-not-empty ng-dirty ng-touched timesheet-focus ng-valid-parse

*** Keywords ***

Fill In Form
  Input Text        ${IDENTIFIER}    8   clear=false
  Input Text        ${IDENTIFIER}    8   clear=false
  Input Text        ${IDENTIFIER}    8   clear=false
  Input Text        ${IDENTIFIER}    8   clear=false
  Input Text        ${IDENTIFIER}    8   clear=false
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
  Open Browser      ${WELCOMEURL}   ${BROWSER} 
  Execute Manual Step   Please Login and then press Pass
  Page should contain               Hi
  Page should contain               ${name}

  # Check and fill in for overdue
  Repeat Keyword    12 times      Fill Overdue Form Only If Needed
  Page Should Contain     No overdue time reports

  # Run for today
  Run Keyword                       Fill In Form