#Removendo o container e images associadas (ALL)

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)

#Inicializando o container

docker-compose up -d
docker exec -it wingetty nginx

#Se o arquivo de inicializacao nao existe
if [ ! -f "/var/www/html/WinGetty-main/restart.sh" ]; then
	echo "#!/bin/bash">>/var/www/html/WinGetty-main/restart.sh
	echo docker restart wingetty>>/var/www/html/WinGetty-main/restart.sh
	echo docker exec -it wingetty nginx>>/var/www/html/WinGetty-main/restart.sh
	chmod +x /var/www/html/WinGetty-main/restart.sh
fi

