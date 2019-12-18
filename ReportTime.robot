*** Test Cases ***

User can fill in a standard 40 hour time card

  Open Browser    chrome://newtab/    ${BROWSER}
  Click Element    xpath=(//div[@class="col-container"])[2]
  Input Text    //input[@name="mondayTimesheetHourValue"]    8
  Click Element    xpath=(//div[@class="col-container"])[3]
  Input Text    //input[@name="tuesdayTimesheetHourValue"]    8
  Click Element    xpath=(//div[@class="col-container"])[4]
  Input Text    //input[@name="wednesdayTimesheetHourValue"]    8
  Click Element    xpath=(//div[@class="col-container"])[5]
  Input Text    //input[@name="thursdayTimesheetHourValue"]    8
  Click Element    xpath=(//div[@class="col-container"])[6]
  Input Text    //input[@name="fridayTimesheetHourValue"]    8
  Click Element    //input[@name="btnSubmit"]