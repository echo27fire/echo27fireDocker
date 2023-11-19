#!/bin/bash

# This script runs a Docker container named "bind" with the following configurations:
# - The container is started in detached mode and will automatically restart if it stops.
# - The container is connected to the "pub_net" network.
# - The container is assigned the IP address 192.168.17.17.
# - The container uses 192.168.18.5 as its DNS server.
# - Port 53 is mapped to both TCP and UDP protocols.
# - Port 10000 is mapped to TCP protocol.
# - The "/docker/appdata/bind" directory on the host machine is mounted to the "/data" directory inside the container.
# - The container image used is "eafxx/bind".

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
