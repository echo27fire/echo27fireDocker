#!/bin/bash

# This script runs the Portainer agent Docker container.
# It exposes port 9001 and mounts the Docker socket and volumes directory.
# The container is named "portainer_agent" and set to restart always.

docker run -d \
 -p 9001:9001 \
 --name portainer_agent \
 --restart=always \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /var/lib/docker/volumes:/var/lib/docker/volumes \
 portainer/agent:latest
