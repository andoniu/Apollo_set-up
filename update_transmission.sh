#!/usr/bin/bash
docker pull dperson/transmission
docker stop transmission
docker rm transmission
docker run --name transmission -e TZ=UTC+2 \
-e USERID=`id -u media` -e GROUPID=`id -g media` -e TRPASSWD='somePass' \
-v /home/ovidiu/transmission:/var/lib/transmission-daemon \
-v /media/4TB/Descărcări/downloads:/var/lib/transmission-daemon/downloads \
-v /media/4TB/Descărcări/incomplete:/var/lib/transmission-daemon/incomplete \
-v /media/4TB/seriale:/tv \
-v /media/2TB/Filme:/movies \
-v /media/500GB/Muzică/Colecție:/music \
-d -p 9091:9091 --restart=always dperson/transmission
