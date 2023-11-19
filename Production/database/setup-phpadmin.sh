#!/bin/bash
# This script runs a Docker container for phpMyAdmin, a web-based database management tool.
# It sets up the necessary environment variables and mounts a configuration file.
# The container is named "dbadmin" and is detached (-d) to run in the background.
# The MySQL root password is set to "test" and the MySQL user and password are left empty.
# The phpMyAdmin host is set to "mariadb" and the port is set to 3306.
# The container's port 80 is mapped to the host's port 8080.
# The configuration file config.user.inc.php is mounted from /appdata/dbadmin/config.user.inc.php.
# The image used for the container is phpmyadmin/phpmyadmin.

docker run -d --name dbadmin  \
 -e MYSQL_ROOT_PASSWORD=test \
 -e MYSQL_USER= \
 -e MYSQL_PASSWORD=\
 -e PMA_HOST=mariadb \
 -e PMA_PORT=3306 \
 -p 8080:80 \
 -v /appdata/dbadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php \
 phpmyadmin/phpmyadmin
