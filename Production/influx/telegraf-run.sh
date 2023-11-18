#!/bin/bash
docker run -d --name=telegraf \
-v /docker/appdata/telegraf.conf:/var/lib/influxdb \
--net=influxdb-telegraf-net \
--restart=always \
telegraf:latest
