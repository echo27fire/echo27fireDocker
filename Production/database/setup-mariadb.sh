#!/bin/bash
# This script starts a MariaDB container with the following configurations:
# - The container will always restart automatically.
# - Port 3306 of the container is mapped to port 3306 of the host machine.
# - The root password for the MariaDB instance is left empty.
# - The database named "database1" will be created.
# - The user credentials for the database are left empty.
# - The data directory of the MariaDB container is mapped to "/appdata/mariadb/data" on the host machine.
# - The configuration directory of the MariaDB container is mapped to "/appdata/mariadb/config" on the host machine.
# - The container is based on the latest version of the MariaDB image.

docker run -d --name mariadb \
--restart=always \
-p 3306:3306 \
-e MARIADB_ROOT_PASSWORD= \
-e MARIADB_DATABASE=database1 \
-e MARIADB_USER= \
-e MARIADB_PASSWORD= \
-v /appdata/mariadb/data:/var/lib/mysql \
-v /appdata/mariadb/config:/etc/mysql/conf.d \
mariadb:latest
