#!/bin/bash
cd /home/lutz/dev/docker/postgres/estoque
docker-compose up -d
sleep 2
docker exec -it estoque_db_1 psql -d estoque
