#!/bin/bash


# This script runs a Docker container for sshwifty, a tool for managing SSH connections.
# It starts the container with the following configurations:
# - The container will be automatically restarted if it stops.
# - Port 8182 on the host machine will be mapped to port 8182 in the container.
# - The container will be named "sshwifty".
# - The directory "/docker/appdata/sshwifty" on the host machine will be mounted to "/home/sshwifty/.config/" in the container.
# - The environment variables SSHWIFTY_DOCKER_TLSCERT and SSHWIFTY_DOCKER_TLSCERTKEY will be set with the contents of the files "domain.crt" and "domain.key" respectively.
# - The Docker image "niruix/sshwifty:latest" will be used to create the container.

SSLGEN=./generate-ssl-cert.sh # Path to the generate-ssl-cert.sh script whcih generates a self-signed SSL certificate.
SSLGEN
echo '---------------------------------------------------'

docker run -d \
 --restart=always \
 -p 8182:8182 \
 --name sshwifty \
 -v /docker/appdata/sshwifty:/home/sshwifty/.config/ \
 -e SSHWIFTY_DOCKER_TLSCERT="$(cat domain.crt)" \
 -e SSHWIFTY_DOCKER_TLSCERTKEY="$(cat domain.key)" \
 niruix/sshwifty:latest
