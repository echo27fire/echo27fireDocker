#!/bin/bash
# This script runs a Docker container with WireGuard VPN server.
# It sets the environment variables WG_HOST and PASSWORD, mounts a volume for WireGuard configuration,
# exposes ports 51820/udp and 51821/tcp, adds necessary capabilities and sysctl settings,
# and ensures the container restarts unless stopped.

docker run -d -e \
 WG_HOST=45.33.88.16 \
 -e PASSWORD=SVmZuZ#274xk4X \
 -v /docker/appdata/wg-easy/:/etc/wireguard \
 -p 51820:51820/udp \
 -p 51821:51821/tcp \
 --cap-add=NET_ADMIN \
 --cap-add=SYS_MODULE \
 --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
 --sysctl="net.ipv4.ip_forward=1" \
 --restart unless-stopped 
 weejewel/wg-easy
