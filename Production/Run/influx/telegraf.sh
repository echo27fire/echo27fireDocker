#!/bin/bash
# This script runs a Docker container named "telegraf" with the following configurations:
# - Mounts the telegraf.conf file from the host machine to the /var/lib/influxdb directory inside the container
# - Connects the container to the "influxdb-telegraf-net" network
# - Sets the container to restart automatically
# - Uses the "telegraf:latest" image

docker run -d --name=telegraf \
 -v /docker/appdata/telegraf.conf:/var/lib/influxdb \
 --net=influxdb-telegraf-net \
 --restart=always \
 telegraf:latest
