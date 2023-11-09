#!bin/bash

sleep 5

wp config create    --allow-root \
                    --dbname=$MYSQL_DATABASE \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'

/usr/sbin/php-fpm81 -F

