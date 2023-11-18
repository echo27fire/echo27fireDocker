#!/bin/bash

docker run -d --name=influxdb \
-p 8086:8086 \
-v /docker/appdata/influxdb:/root/.influxdb2 \
--net=influxdb-telegraf-net \
--restart=always \
influxdb:2.2
