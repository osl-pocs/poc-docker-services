#!/usr/bin/env bash
set -e

PROJECT_PATH=$(echo $( cd "$( dirname "${BASH_SOURCE[0]}")" && cd .. && pwd ))
cd $PROJECT_PATH

touch .env
export $(cat .env)

HOST_IP=$(ip addr show dev wlp2s0 | grep -w inet | awk '{print $2}' | cut -d '/' -f 1)

# start the web server with just http
./setup/app.sh http

# Create the first certificates for the web server
CERTBOT_EXTRA_ARGS=
if [[ "$ENV" == "staging" ]]; then
  CERTBOT_EXTRA_ARGS="--staging"
else
  CERTBOT_EXTRA_ARGS="--server http://$HOST_IP:4001/directory"
fi

if [[ "$ENV" == "dev" ]]; then
  CERTBOT_EXTRA_ARGS="${CERTBOT_EXTRA_ARGS} --dry-run -vvv"
fi

set -x
# certbot certonly --nginx --staging -d example.org
docker-compose run --rm certbot \
  certonly -v $CERTBOT_EXTRA_ARGS \
  --webroot \
  --webroot-path /var/www/acme-challenge/ \
  --agree-tos \
  --no-eff-email \
  --reinstall \
  --renew-by-default \
  --text \
  --email ivan.ogasawara@gmail.com \
  -d ${SERVER_DOMAIN}
set +x

# start the web server with just https
./setup/app.sh https

set +e
