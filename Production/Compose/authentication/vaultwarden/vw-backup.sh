#!/bin/bash

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