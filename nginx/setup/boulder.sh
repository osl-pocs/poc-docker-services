#!/usr/bin/env bash

PROJECT_PATH=$(echo $( cd "$( dirname "${BASH_SOURCE[0]}")" && cd .. && pwd ))

cd "$PROJECT_PATH"

git clone https://github.com/letsencrypt/boulder.git || true
cd boulder

docker-compose build
docker-compose up -d

docker-compose logs --follow boulder
