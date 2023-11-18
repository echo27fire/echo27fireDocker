#!/bin/bash

docker run -d --name mariadb \
 --restart=always \
 -p 3306:3306 \
 -e MARIADB_ROOT_PASSWORD= \
 -e MARIADB_DATABASE=database1 \
 -e MARIADB_USER= \
 -e MARIADB_PASSWORD= \
 -v /appdata/mariadb/data:/var/lib/mysql \
 -v /appdata/mariadb/config:/etc/mysql/conf.d \
 mariadb:latest
