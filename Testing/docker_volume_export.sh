#!/bin/bash

# Copy Docker volume from one host to another for upgrade or backup purposes.

# Set variables
Docker_Path="/var/lib/docker/volumes"
Log_Path="/tmp/docker_volume_copy.log"
volume_archive_path="/tmp"
target_host="10.16.200.2" # IP address of the host to copy the volume to

line_break () {
    echo "----------------------------------------"
}

after_action_message () {
    echo "Here are the containers that were backed up to $target_host:"
    cat "$volume_archive_path/stopped_containers.txt"
    line_break
    echo "Please verify that no net-new containers were created since the last backup."
    echo "If there are net-new containers, please recreate them on $target_host and restart them."
}

# Stop containers and save their names for restart
stop_and_save_containers() {
    running_containers=$(docker ps --format "{{.Names}}")
    for container in $running_containers; do
        docker stop "$container" && echo "Stopped container: $container" || echo "Failed to stop container: $container"
        echo "$container" >> "$volume_archive_path/stopped_containers.txt"
    done
}

# Create archive of volume
archive_docker_volumes () {
    for volume in $(ls $Docker_Path); do
        tar -czf "$volume_archive_path/$volume.tar.gz" -C "$Docker_Path" "$volume" && echo "Docker volume $volume archived" >> "$Log_Path"
    done
}

# Create checksum of volume archive
create_checksums () {
    find $volume_archive_path -type f -name "*.tar.gz" -exec md5sum {} \; > $volume_archive_path/checksums.md5
}

# Copy volume from source to destination
copy_archive_to_target () {
    scp -r $volume_archive_path $target_host:$volume_archive_path
}

# Verify volume copied successfully
verify_copy () {
    ssh $target_host "cd $volume_archive_path && md5sum -c checksums.md5"
    if [ $? -eq 0 ]; then
        echo "Volume copied successfully" >> $Log_Path
    else
        echo "Volume copy failed" >> $Log_Path
    fi
}

# Restart containers
restart_stopped_containers () {
    while IFS= read -r container; do
        docker start "$container" && echo "Started container: $container" || echo "Failed to start container: $container"
    done < "$volume_archive_path/stopped_containers.txt"
}

# Start script
date >> $Log_Path # Log date of backup run

echo "Starting backup of Docker volumes"
line_break

# Call functions
stop_and_save_containers
archive_docker_volumes
create_checksums
copy_archive_to_target
verify_copy
restart_stopped_containers

echo "Backup complete"
line_break
after_action_message
