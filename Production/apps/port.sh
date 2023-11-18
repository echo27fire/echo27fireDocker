#!/bin/bash
echo '---------------------------------------------------'
echo 'deploying portainer '
echo '---------------------------------------------------'


 docker run -d \
 -p 8081 :8000 \
 -p 9443:9443 \
 --name portainer \
 --restart=always \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /docker/appdata/portainer:/data \
 portainer/portainer-ce:latest

