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
...
...   Pro tip - for half hours hit tab-3 to select the third item in the drop down

# Library   Dialogs     # Built-in, but requires tkinter as part of Python install.
Library   SeleniumLibrary     # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library   Screenshot
Library   OperatingSystem

Variables   ${CURDIR}${/}my_timecards.py

*** Variables ***

${BROWSER}  googlechrome
${PTRURL}   https://hrnet.uihr.uillinois.edu/PTRApplication/index.cfm?fuseaction=TimeSheetEntryForm


*** Test Cases ***

User gets PTR up to date by filling in any cards

  Given user is logged in to PTR
  When User Fills Past Due Time Cards
  Then Page Should Contain     No overdue time reports

*** Keywords ***


Fill Time Card
  [Arguments]    ${time_values}
  Log To Console    \nWill fill in ${time_values}
  Input Text    mondayTimesheetHourValue    ${time_values}[monday]   clear=false
  Input Text    tuesdayTimesheetHourValue    ${time_values}[tuesday]   clear=false
  Input Text    wednesdayTimesheetHourValue    ${time_values}[wednesday]   clear=false
  Input Text    thursdayTimesheetHourValue    ${time_values}[thursday]   clear=false
  Input Text    fridayTimesheetHourValue    ${time_values}[friday]   clear=false
  # Click Element    //input[@name="btnSubmit"]
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
  # %{ } - environemnt var
  Input Text        netid      %{USER}          clear=false
  Input Text        easpass    %{EASPASS}       clear=false
  # Take Screenshot
  Click Element     BTN_LOGIN
  Page should contain               Welcome

User fills in all overdue time cards
  Repeat Keyword    12 times      Fill Overdue Form Only If Needed
  Page Should Contain     No overdue time reports

User fills in latest time card
  Run Keyword                       Fill In Form

User Fills Past Due Time Cards
   FOR    ${week}    IN    @{TIMECARDS.keys()}
       Log To Console    \nWill attempt to fill in ${week}
       Select Past Due Time Card        ${week}
       Fill Time Card           time_values=${TIMECARDS["${week}"]}
   END

Select Past Due Time Card
    [Arguments]    ${select_date}
    Select From List by Label         id:pastDueWeek        ${select_date}      
    Click Element        getPastDueTimeEntryForm
    # Wait Until Page Contains      Enter Time For The Week Starting 05/07/2023
    # Page Should Contain     Enter Time For The Week Starting ${select_date}
   
