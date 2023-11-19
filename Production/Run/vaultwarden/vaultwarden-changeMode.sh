#!/bin/bash
# This script is used to stop and remove the Vaultwarden Docker container.
# This script is intended to be used to change from the signups allowed to signup disabled mode configuration.
# Changing this may not be needed if using the Vaultwarden web interface to change the configuration, or the admin panel.

echo "stopping vaultwarden" 
docker stop vaultwarden 1>/dev/null
echo "removing vaultwarden"
docker rm vaultwarden 1>/dev/null
