
## Setup

Robotframework is cross platform, but these installation instructions are Windows-specific.

Install steps on Mac or Linux should actually be slightly simpler, but I do not want to publish them without testing them. A pull request to add Windows or Linux install instructions would be welcomed. 

Requirements:
  - Python3 (be sure to include tk / tkinter library)
  - chromedriver
  - RobotFramework
  - robotframework-seleniumlibrary

Install steps:
  - Install [Python3](https://www.python.org/downloads/windows/) using the Python installer. ***Be sure to include tk / tkinter in the install options.***
  - Install [Chocolatey](https://chocolatey.org/install)
  - Run the following steps to use Pip and Chocolatey to install the remaining requirements.

Once you have Python3 and Chocolatey installed, you can install the rest using the following commands:

```powershell
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
choco install chromedriver
```

## Running the Robotframewok script

Run the command like so:
```powershell
robot .\ReportTime.robot
```

## Using the tool

- The browser will pause on the login page.
- A small pop-up will appear, asking you to press 'Pass' to resume the script once you are logged in.
- You will be prompted to verify each week of data. 40 hours will be pre-filled. Make any changes and then press 'Pass' again.
- The script will continue to prompt you until your overdue time reports have been verified and submitted.
- Abort at any time by closing the browser window.
- The PTR application and this script will automatically pick up where you left off next time you visit.
- The browser window will close automatically once you are caught up.

## Command line output

The output of a successful run looks a bit like this:

```powershell
==============================================================================
ReportTime :: Assists users in quickly filling out and verifying their PTR ...
==============================================================================
User gets PTR up to date by filling in any cards
------------------------------------------------------------------------------
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  C:\src\RobotFramework\output.xml
Report:  C:\src\RobotFramework\report.html
```