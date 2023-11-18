#!/bin/bash

docker run --name bind \
 -d --restart=always \
 --network=pub_net \
 --ip=192.168.17.17 \
 --dns=192.168.18.5 \
 -p 53:53/tcp \
 -p 53:53/udp \
 -p 10000:10000/tcp \
 -v /docker/appdata/bind:/data \
  eafxx/bind
