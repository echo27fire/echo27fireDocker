#!/bin/bash

# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# Define schema path
GUACAMOLE_SCHEMA_PATH="/home/shared/guacamole-dkr-comp/guacamole-client-1.5.3/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-mysql/schema"

# Run the MySQL client from Docker to execute SQL files
docker run --rm -v ${GUACAMOLE_SCHEMA_PATH}:/schema \
-e MYSQL_HOST=${HOST_IP} \
-e MYSQL_PORT=${DB_PORT} \
-e MYSQL_USER=${DB_USER} \
-e MYSQL_PASSWORD=${DB_PASS} \
-e MYSQL_DATABASE=${DB_DBSE} \
mysql:latest bash -c "mysql -h \$MYSQL_HOST -P \$MYSQL_PORT -u \$MYSQL_USER -p\"\$MYSQL_PASSWORD\" \$MYSQL_DATABASE < /schema/001-create-schema.sql && mysql -h \$MYSQL_HOST -P \$MYSQL_PORT -u \$MYSQL_USER -p\"\$MYSQL_PASSWORD\" \$MYSQL_DATABASE < /schema/002-create-admin-user.sql"

echo "Schema imported successfully."
 
