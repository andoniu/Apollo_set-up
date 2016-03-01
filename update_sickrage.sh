docker pull linuxserver/sickrage
docker stop sickrage
docker rm sickrage
docker run -d --name=sickrage \
-v /home/ovidiu/sickrage:/config \
-v /media/4TB/Descărcări:/downloads \
-v /media/4TB/seriale:/tv \
-e PGID=`id -g media` -e PUID=`id -u media` \
-p 8081:8081 --restart=always \
-v /media/4TB/seriale_de_sortat:/de_sortat linuxserver/sickrage

# Just update internal, don't update the image
#docker restart sickrage

