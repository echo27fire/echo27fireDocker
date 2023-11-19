#!/bin/bash

# This script runs the InfluxDB container with the following configurations:
# - Container name: influxdb
# - Port mapping: 8086:8086
# - Volume mapping: /docker/appdata/influxdb:/root/.influxdb2
# - Network: influxdb-telegraf-net
# - Restart policy: always
# - InfluxDB version: 2.2
docker run -d --name=influxdb \
 -p 8086:8086 \
 -v /docker/appdata/influxdb:/root/.influxdb2 \
 --net=influxdb-telegraf-net \
 --restart=always \
 influxdb:2.2
