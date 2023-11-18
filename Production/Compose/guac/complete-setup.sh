#!/bin/bash
# Load environment variables from .env file
set -o allexport
source .env
set +o allexport


GUAC_PATH=/home/docker-compose/guacamole
if [ -d $GUAC_PATH ];
then
    mkdir -p $GUAC_PATH
    cd $GUAC_PATH || exit
else
    cd $GUAC_PATH || exit
fi

echo "---------------------------------------"
echo "   Downloading guac source codes       "
echo "---------------------------------------"

GUAC_CLIENT='https://apache.org/dyn/closer.lua/guacamole/1.5.3/source/guacamole-client-1.5.3.tar.gz'
GUAC_SERVER='https://apache.org/dyn/closer.lua/guacamole/1.5.3/source/guacamole-server-1.5.3.tar.gz'

curl -LO $GUAC_CLIENT || echo 'clinet download errors'
curl -LO $GUAC_SERVER || echo 'server download errors'

tar -xzf $GUAC_CLIENT
tar -xzf $GUAC_SERVER

echo "---------------------------------------"
echo "        guac source unpacked           "
echo "---------------------------------------"


GUACAMOLE_SCHEMA_PATH="$GUAC_PATH/guacamole-client-*/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-mysql/schema"

# Run the MySQL client from Docker to execute SQL files
docker run --rm -v "${GUACAMOLE_SCHEMA_PATH}":/schema -e MYSQL_HOST="${HOST_IP}" -e MYSQL_PORT="${DB_PORT}" -e MYSQL_USER="${DB_USER}" -e MYSQL_PASSWORD="${DB_PASS}" -e MYSQL_DATABASE="${DB_DBSE}"

echo "Schema imported successfully."

