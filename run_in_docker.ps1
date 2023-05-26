docker run -v "${PWD}:/opt/robotframework/reports:Z" -v "${PWD}:/opt/robotframework/tests:Z" --env-file "${PWD}/.env" ppodgorsek/robot-framework
