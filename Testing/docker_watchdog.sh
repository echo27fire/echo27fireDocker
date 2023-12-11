#!/bin/bash

# Docker watchdog script for CRON
# Checks if the Docker service is running and restarts it if necessary.
# Also checks important containers and restarts them if they are not running.

# Set variables
mgmt_containers=("portainer2" "nginx-proxy" "heimdall") # Containers for management
rmm_containers=("cmk-sfit-1" "cmk-umed-1") # Containers for RMM
guac_containers=("guacamole-guacd-1" "guacamole-mysql-1" "guacamole-guacamole-1") # Containers for remote access

important_containers=("${mgmt_containers[@]}" "${rmm_containers[@]}" "${guac_containers[@]}") # All important containers

# Log file
watchdog_docker_log="/tmp/watchdog_docker.log" # Log file for the Docker watchdog script

log_with_date () {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$watchdog_docker_log"
}

# Check and restart Docker service if necessary
# This script checks if the Docker service is active. If it is not active, it attempts to restart the service.
# If the restart is successful, a log message is generated indicating that the Docker service has been restarted.
# If the restart fails, a log message is generated indicating the failure, and an optional notification mechanism can be added.
# If the Docker service is already running, a log message is generated indicating that the service is running.

if [ "$(systemctl is-active docker)" != "active" ]; then
    log_with_date "Docker service is not running"
    if systemctl restart docker; then
        log_with_date "Docker service restarted"
    else
        log_with_date "Failed to restart Docker service"
        log_with_date "Recent Docker service logs:"
        journalctl -u docker --since "10 minutes ago" >> "$watchdog_docker_log"
    fi
else
    log_with_date "Docker service is running"
fi

# Check and restart important containers if necessary
# This script iterates through the list of important containers and checks if they are running.
# If a container is not running, it attempts to start it and logs the result.
# Optionally, a notification mechanism can be added to notify about failed container starts.

for container in "${important_containers[@]}"; do
    if [ "$(docker inspect -f '{{.State.Running}}' "$container")" != "true" ]; then
        log_with_date "$container is not running"
        if docker start "$container"; then
            log_with_date "$container started"
        else
            log_with_date "Failed to start $container"
            # Optional: Add notification mechanism here
        fi
    else
        log_with_date "$container is running"
    fi
done