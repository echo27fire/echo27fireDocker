#!/bin/bash

# This script runs a Docker container named "watchtower" using the containrrr/watchtower image.
# The container is set to restart always and mounts the Docker socket for communication with the host's Docker daemon.
# It also configures email notifications for watchtower updates.
# The email settings include the email addresses for sending and receiving notifications,
# the SMTP server details, and the delay between sending notifications.
# Make sure to replace the placeholder values with the actual email addresses and server credentials.

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
