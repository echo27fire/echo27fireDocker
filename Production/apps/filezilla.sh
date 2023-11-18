#!/bin/bash
echo "--------------------------"
echo "   deploying filezilla"
echo "--------------------------"


docker run -d \
 --name filezilla \
 -e PUID=1000 \
 -e PGID=1000 \
 -e TZ=America/New_York \
 -p 3000:3000 \
 -v /docker/appdata/filezilla:/config \
 --restart unless-stopped \
 lscr.io/linuxserver/filezilla:latest


echo "--------------------------"
echo "   deployment complete "
echo "--------------------------"

