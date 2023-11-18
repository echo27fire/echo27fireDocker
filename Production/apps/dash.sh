#!/bin/bash

echo "------------------------------"
echo "     deploying app dash      "
echo "------------------------------"


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

