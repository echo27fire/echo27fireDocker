#!/bin/bash

echo "------------------------------"
echo "     deploying app dash      "
echo "------------------------------"


# This script runs a Docker container for Heimdall Dashboard.
# It sets the necessary environment variables, exposes ports 8081 and 8082,
# mounts a volume for persistent data storage, and ensures the container restarts unless stopped.

docker run -d \
 --name=heimdall \
 -e PUID=1000 \
 -e PGID=1000 \
 -e TZ=America/New_York \
 -p 8081:80 \
 -p 8082:443 \
 -v /appdata/heimdall:/config \
 --restart unless-stopped \
 lscr.io/linuxserver/heimdall:latest

echo "------------------------------"
echo "     deployment complete      "
echo "------------------------------"

