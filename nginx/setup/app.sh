#!/usr/bin/env bash
#
## NOTES:
#   - First parameter should be "http" OR "https"
#   - Second parameter is the server domain
##
set -ex
PROJECT_PATH=$(echo $( cd "$( dirname "${BASH_SOURCE[0]}")" && cd .. && pwd ))
cd $PROJECT_PATH

touch .env
export $(cat .env)
export NGINX_PROTOCOL=${1:-http}


# start the web server with just http
docker-compose rm --force --stop -v  app nginx
docker-compose up --force-recreate -d app nginx
set +ex
