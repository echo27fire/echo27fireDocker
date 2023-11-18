#!/bin/bash
docker run -d --name dbadmin  \
 -e MYSQL_ROOT_PASSWORD=test \
 -e MYSQL_USER= \
 -e MYSQL_PASSWORD=\
 -e PMA_HOST=mariadb \
 -e PMA_PORT=3306 \
 -p 8080:80 \
 -v /appdata/dbadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php \
 phpmyadmin/phpmyadmin
