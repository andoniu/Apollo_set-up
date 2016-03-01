#!/usr/bin/zsh
docker pull emby/embyserver
docker stop emby_server
docker rm emby_server
docker run -d --net=host -v /home/ovidiu/emby/:/config -v /exports:/media -e TZ=UTC+2 --name=emby_server --restart=always emby/embyserver && \
echo "Emby server updated ok." && exit 0

echo "Failed to update the emby server"
