# Requires `podman machine set --rootful`
podman run --rm -v "${PWD}:/opt/robotframework/reports:Z" -v "${PWD}:/opt/robotframework/tests:Z" --env-file "${PWD}/.env" ppodgorsek/robot-framework
