*** Settings ***
Documentation   Let us learn to use this thing.
...   Must do the following to setup:
...   pip install robotframework
...   pip install --upgrade robotframework-seleniumlibrary
...   choco install chromedriver
...   pip install pyyaml.
...   choco install vault
...   choco install consul
...   consul agent -dev # New Window
...   vault server -config=./vaultconfig.hcl -address=http://127.0.0.1:8200 # New Window
...   vault init  -address=http://127.0.0.1:8200
...   $ENV:VAULT_ADDR="http://127.0.0.1:8200 # To match address on previous line
...   cp login-example.robot login.robot # Add your login info
...   vault kv put secret/login.robot value=@login.robot


Resource  login.robot

Library   Dialogs     # Built-in, but requires tkinter as part of Python install.
# Library   Screenshot
Library   SeleniumLibrary
# https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Variables ***

${BROWSER}  googlechrome
${PTRURL}   https://hrnet.uihr.uillinois.edu/PTRApplication/index.cfm?fuseaction=TimeSheetEntryForm

*** Test Cases ***

User can fill in a standard 40 hour time card

  Open Browser      ${PTRURL}   ${BROWSER} 
  Input Text        netid       ${netid}
  Input Password    PASSWORD    ${pwd}
  Submit Form
  # Execute Manual Step   Please Login
  # Maximize Browser Window
  # Click Element    xpath=(//div[@class="col-container"])[2]
  # Input Text    //input[@name="mondayTimesheetHourValue"]    8
  # Handle Alert
  Input Text        mondayTimesheetHourValue    8   clear=false
  Input Text        tuesdayTimesheetHourValue    8   clear=false
  Input Text        wednesdayTimesheetHourValue    8   clear=false
  Input Text        thursdayTimesheetHourValue    8   clear=false
  Input Text        fridayTimesheetHourValue    8   clear=false
  # Click Element    xpath=(//div[@class="col-container"])[3]
  # Input Text    //input[@name="tuesdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[4]
  # Input Text    //input[@name="wednesdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[5]
  # Input Text    //input[@name="thursdayTimesheetHourValue"]    8
  # Click Element    xpath=(//div[@class="col-container"])[6]
  # Input Text    //input[@name="fridayTimesheetHourValue"]    8
  # Click Element    //input[@name="btnSubmit"]
  
  # Verify via "You have successfully submitted your time"
  ## Do it again...
  # Click Element    input[@name="getTimeEntryForm"]