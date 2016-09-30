#!/bin/bash

# Load Overrides File for overwriting Environment Variables in this file
# This will allow git pulls as they will overwrite this file, but not the overrides.env
if ! [ -f ./overrides.env ]; then
	touch ./overrides.env
fi
. ./overrides.env

# Set Variables
export ES_SERVER="${ES_SERVER:-1.1.1.1}"
export FLUENTD_SERVER="${FLUENTD_SERVER:-1.1.1.1}"
export DOCKER_VOLUMES_DIR="${DOCKER_VOLUMES_DIR:-/opt/docker_data}"
docker-compose "$@"
