#!/bin/bash

# This script deploys FileZilla using Docker.
# It sets the necessary environment variables, mounts volumes, and exposes the required ports.
# The container is named "filezilla" and will be automatically restarted unless stopped.

echo "--------------------------"
echo "   deploying filezilla"
echo "--------------------------"

docker run -d \
 --name filezilla \
 -e PUID=1000 \
 -e PGID=1000 \
 -p 3000:3000 \
 -v /docker/appdata/filezilla:/config \
 -v /etc/timezone:/etc/timezone:ro \ 
 --restart unless-stopped \
 lscr.io/linuxserver/filezilla:latest

echo "--------------------------"
echo "   deployment complete "
echo "--------------------------"
