#!/bin/bash

docker run -d \
 --restart=always \
 --name watchtower \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -e WATCHTOWER_NOTIFICATIONS=email \
 -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=fromaddress@gmail.com \
 -e WATCHTOWER_NOTIFICATION_EMAIL_TO=toaddress@gmail.com \
 -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com \
 -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
 -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=fromaddress@gmail.com \
 -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=app_password \
 -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
 containrrr/watchtower:latest
