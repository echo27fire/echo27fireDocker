#!/bin/bash

# This script is used to create backups of the vw-backups directory and copy them to the Saturn and Jupiter paths.
# It generates a backup file with the current date in the filename and logs any errors encountered during the process.

# labels
FILE_DATE=$(date +%Y-%m-%d)  # Current date in the format YYYY-MM-DD
FILE_NAME=vw-backup.$FILE_DATE.tar.gz  # Backup file name with the current date appended
SCRIPT_LOG=vw-backup.log  # Log file name for recording any errors encountered during the backup process

# local
LOCAL_BACKUP_PATH=/home/shared/  # Local path where the backup file will be created
LOCAL_BACKUP_DIR=vw-backups  # Directory to be backed up

# Saturn
SATURN_PATH=/mnt/saturn  # Path to the Saturn destination for the backup file

# Jupiter
JUPITER_PATH=/mnt/jupiter  # Path to the Jupiter destination for the backup file

# Change to the local backup path or exit if it fails
cd $LOCAL_BACKUP_PATH || exit

# Create a compressed backup file of the local backup directory and redirect any errors to the script log file
tar -czf "$FILE_NAME" ./$LOCAL_BACKUP_DIR 2>$(pwd)/$SCRIPT_LOG

# Copy the backup file to the Saturn path and redirect any errors to the script log file
cp ./"$FILE_NAME" $SATURN_PATH 2>$(pwd)/$SCRIPT_LOG

# Copy the backup file to the Jupiter path and redirect any errors to the script log file
cp ./"$FILE_NAME" $JUPITER_PATH 2>$(pwd)/$SCRIPT_LOG
# labels
FILE_DATE=$(date +%Y-%m-%d)
FILE_NAME=vw-backup.$FILE_DATE.tar.gz
SCRIPT_LOG=vw-backup.log

# local
LOCAL_BACKUP_PATH=/home/shared/
LOCAL_BACKUP_DIR=vw-backups

# Saturn
SATURN_PATH=/mnt/saturn

# Jupiter
JUPITER_PATH=/mnt/jupiter



cd $LOCAL_BACKUP_PATH || exit
tar -czf "$FILE_NAME" ./$LOCAL_BACKUP_DIR 2>$(pwd)/$SCRIPT_LOG

cp ./"$FILE_NAME" $SATURN_PATH 2>$(pwd)/$SCRIPT_LOG
cp ./"$FILE_NAME" $JUPITER_PATH 2>$(pwd)/$SCRIPT_LOG