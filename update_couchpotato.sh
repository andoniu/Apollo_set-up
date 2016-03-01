docker pull linuxserver/couchpotato
docker stop couchpotato
docker rm couchpotato
docker run -d --name=couchpotato \
-v /etc/localtime:/etc/localtime:ro \
-v /home/ovidiu/couchpotato:/config \
-v /media/4TB/Descărcări/downloads:/downloads \
-v /media/2TB/Filme:/movies \
-e PGID=`id -g media` -e PUID=`id -u media` \
-p 5050:5050 --restart=always linuxserver/couchpotato

