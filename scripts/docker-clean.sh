#!/usr/bin/env bash
docker system prune -f
docker container prune -f
docker stop $(docker ps -a -q) 
docker rm $(docker ps -a -q)
docker image prune -f
docker rmi $(docker images -a -q)
docker volume prune -f
docker network prune -f