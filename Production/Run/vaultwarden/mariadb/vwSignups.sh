#!/bin/bash

KEY=$(cat ./vw.key)

docker run -d --name vaultwarden \
 -p 8800:80 \
 -p 9900:443 \
 -e SIGNUPS_ALLOWED=true \
 -e INVITATIONS_ALLOWED \
 -e WEBSOCKET_ENABLED=true \
 -e ADMIN_TOKEN=$KEY \
 -e DATABASE_URL= \
 vaultwarden/server:alpine

