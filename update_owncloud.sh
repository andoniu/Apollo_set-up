#!/usr/bin/zsh
cd /home/ovidiu/owncloud
docker-compose pull
docker pull owncloud
docker-compose stop
docker-compose rm -f
docker-compose up -d
