#!/bin/bash

SSLGEN=./sslgen.sh

SSLGEN


docker run -d \
 --restart=always \
 -p 8182:8182 \
 --name sshwifty \
 -v /docker/appdata/sshwifty:/home/sshwifty/.config/ \
 -e SSHWIFTY_DOCKER_TLSCERT="$(cat domain.crt)" \
 -e SSHWIFTY_DOCKER_TLSCERTKEY="$(cat domain.key)" \
 niruix/sshwifty:latest
