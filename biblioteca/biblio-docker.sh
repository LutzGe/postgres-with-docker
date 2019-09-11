#!/bin/bash
cd /home/$USER/dev/docker/postgres/biblioteca
docker-compose up -d
sleep 2
docker exec -it biblioteca_db_1 psql -d biblioteca_dados
