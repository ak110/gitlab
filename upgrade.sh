#!/bin/bash
set -eux

docker-compose pull
docker-compose down
docker-compose up -d
docker-compose logs -ft

