#!/bin/bash
echo '---------------------------------------------------'
echo 'deploying portainer '
echo '---------------------------------------------------'


# This script runs a Docker container for Portainer, a web-based management interface for Docker.
# It exposes Portainer on ports 8081 and 9443, and mounts the Docker socket and a data volume for persistence.
# The container is named "portainer" and set to restart always.

docker run -d \
-p 8081:8000 \
-p 9443:9443 \
--name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /docker/appdata/portainer:/data \
portainer/portainer-ce:latest

