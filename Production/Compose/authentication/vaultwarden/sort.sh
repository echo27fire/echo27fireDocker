#!/bin/bash

# labels
DB_NAME='*db.sqlite3'
DATA_NAME='data.tar.gz'
EX_DATA=$(date +%Y-%m-%d-%h-%m)


# local
DB_PATH=db
DATA_PATH=data

# scripts moves into the proper directory where the VW backups are stored
cd "$LOCAL_BACKUP_PATH" || exit
cd "$LOCAL_BACKUP_DIR" || exit

# here the script will find the data and db files in the root backup folder, then move them to a dedicated directory
# each line will echo an error to the log file if it cannot move something with a time stamp.
# a complete message is sent to the log as well after each run.
find -maxdepth 1 -type f -name "$DB_NAME" -exec mv {} $DB_PATH/ \; || echo 'error moving db '"$EX_DATA"'' >> ./mover.log 
find -maxdepth 1 -type f -name $DATA_NAME -exec mv {} $DATA_PATH/ \; || echo 'error moving data '"$EX_DATA"'' >> ./mover.log
echo 'move complete @ '"$EX_DATA"'' >> ./mover.log
