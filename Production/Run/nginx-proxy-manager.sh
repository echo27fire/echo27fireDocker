#!/bin/bash

# This script runs a Docker container for nginx-proxy-manager.
# It exposes ports 82, 80, and 443 for HTTP and HTTPS traffic.
# It sets the UMASK, USER_ID, and GROUP_ID environment variables for file permissions.
# It disables IPv6 and sets the container to restart always.
# It mounts the /appdata/nginx-proxy/ directory as a volume for persistent configuration data.
# The Docker image used is jlesage/nginx-proxy-manager.

docker run -d \
 -p 82:8181 \
 -p 80:8080 \
 -p 443:4443 \
 -e UMASK=000 \
 -e USER_ID=99 \
 -e GROUP_ID=100 \
 -e DISABLE_IPV6=1 \
 --restart=always \
 --name nginx_proxy \
 -v /appdata/nginx-proxy/:/config:rw \
 jlesage/nginx-proxy-manager
