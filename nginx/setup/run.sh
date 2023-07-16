#!/usr/bin/env bash

PROJECT_PATH=$(echo $( cd "$( dirname "${BASH_SOURCE[0]}")" && cd .. && pwd ))
cd $PROJECT_PATH

touch .env
export $(cat .env)

# start the web server with just http
./setup/app.sh http localhost

# Create the first certificates for the web server
CERTBOT_EXTRA_ARGS=
# if [[ "$ENV" == "staging" ]]; then
# CERTBOT_EXTRA_ARGS="--staging"
# fi

# certbot certonly --nginx --staging -d example.org
docker-compose run --rm  certbot certonly $CERTBOT_EXTRA_ARGS \
  --webroot --webroot-path /var/www/certbot/ -v \
  -d ${SERVER_DOMAIN}

# start the web server with just https
./setup/app.sh https ${SERVER_DOMAIN}

