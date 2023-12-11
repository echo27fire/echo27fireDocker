
#!/bin/bash

# Import docker volumes copied from a remote host
# this script is the partner to docker_volume_export.sh and is intended to be run on the remote host

# Set variables
Docker_Path="/var/lib/docker/volumes"
Log_Path="/tmp/docker_volume_copy.log"
volume_archive_path="/tmp"
remote_host="10.16.200.1" # this is the IP address of the remote host files were received from


line_break () {
    echo "----------------------------------------"
}

after_action_message () {
    echo "Here are the containers that were backed up to $target_host:"
    cat "$volume_archive_path/stopped_containers.txt"
    line_break
    line_break
    echo "Please verify that no net-new containers were created since last backup."
    echo "If there are net-new containers, please recreate them here and restart them."
    echo "please also update containers to use the lastest images for update testing"
}



# Stop containers and save their names for restart
stop_and_save_containers() {
    running_containers=$(docker ps --format "{{.Names}}")
    for container in $running_containers; do
        docker stop "$container" && echo "Stopped container: $container" || echo "Failed to stop container: $container"
        echo "$container" >> "$volume_archive_path/stopped_containers.txt"
    done
}

# untar volume archive
untar_volume_archive () {
    for volume in $(ls $volume_archive_path); do
        tar -xzf "$volume_archive_path/$volume" -C "$Docker_Path" && echo "Docker volume $volume untarred" >> "$Log_Path"
    done
}