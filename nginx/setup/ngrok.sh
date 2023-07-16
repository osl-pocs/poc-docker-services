#!/usr/bin/env bash

PROJECT_PATH=$(echo $( cd "$( dirname "${BASH_SOURCE[0]}")" && cd .. && pwd ))

cd $PROJECT_PATH

touch .env
export $(cat .env)

bash setup/app.sh http localhost

# start ngrok
envsubst < ngrok/ngrok.yml.tpl > ngrok/ngrok.yml
docker-compose  up -d --force-recreate ngrok

sleep 10

echo "Visit the following page to get the address to be set to .env SERVER_DOMAIN variable:"
echo "http://127.0.0.1:4040/inspect/http"
