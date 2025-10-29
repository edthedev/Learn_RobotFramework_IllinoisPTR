
## About

This repository contains a single file `ReportTime.robot` which contains examples of concepts needed to do many web application verification steps in RobotFramework.

The purpose of RobotFramework is to speed up verification that important functionality remains intact when upgrading web applications and web application servers.

Using RobotFramework can increase the assurance, availability, reliability and patch frequency of web application systems by increasing confidence in the reliability and testability of software releases, allowing a faster and more trusted software update cycle.

The purpose of this example script is to help familiarize maintainers of web application servers with the capabilities available through the free and open source tool, RobotFramework. 

The process this script directly assists with is correctly and quickly filling in Positive Time Report forms for State of Illinois employees.

## Manual Steps

This script will not set your exact time values.

Fill in your timecard data into `timecards.py`, and let the script tediously type it into the web interface for you.

## Setup

Robotframework is cross platform, but these installation instructions are Windows-specific.

Install steps on Apple/Macintosh or Linux should actually be slightly simpler, but I do not want to publish them without testing them. A pull request to add Apple or Linux install instructions would be welcomed. 

Requirements:
  - Python3 (be sure to include tk / tkinter library)
  - chromedriver
  - RobotFramework
  - robotframework-seleniumlibrary

Install steps:
  - Install [Python3](https://www.python.org/downloads/windows/) using the Python installer. ***Be sure to include tk / tkinter in the install options.***
  - Install [Chocolatey](https://chocolatey.org/install) or Brew
  - Run the following steps to use Pip and Chocolatey to install the remaining requirements.

Once you have Python3 and Chocolatey installed, you can install the rest using the following commands.

```sh
pip install robotframework
pip install wheel
pip install --upgrade robotframework-seleniumlibrary
```

This command may need to run as **Administrator**:

```pwsh
choco install chromedriver
```

Or

```pwsh
brew install chromedriver
```

## Running the Robotframewok script

Run the command like so:
```powershell
robot .\ReportTime.robot
```

If you see this message:
> SessionNotCreatedException: Message: session not created: This version of ChromeDriver only supports Chrome version XX

Run this command (may require administrator privileges):

```powershell
choco upgrade chromedriver
```

or 

```powershell
brew upgrade chromedriver
```

## Using the tool

- Create `timecards.py` from `example_timecards.py`, and fill in your time. Weeks are keyed by the date of the Sunday of that week. Some examples are included in `example_timecards.py`.
- The browser will pause on the login page for about 60 seconds. Login during this time. This duration can be adjusted in the script.
- The script will open and fill out any time periods in the data in `timecards.py` 
- Abort at any time by closing the browser window.
- The PTR application and this script will automatically pick up where you left off next time you visit.
- Close any stray browser windows.

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

## Run Inside a Container

On Windows it can be helpful to run `Robot` scripts inside an Open Container Initiative (OCI) runner such as `Podman` or `Docker`.  See `run_in_podman.ps1` and `run_in_docker.ps1` for example commands.

The `podman info` and `docker info` commands can be helpful when debugging whether the selected OCI tool is configured and running.