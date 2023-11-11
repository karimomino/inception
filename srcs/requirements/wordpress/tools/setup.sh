#!bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ]
then
    while ! wp config create    --allow-root \
                        --dbname=$MYSQL_DATABASE \
                        --dbuser=$MYSQL_USER \
                        --dbpass=$MYSQL_PASSWORD \
                        --dbhost=mariadb:3306 --path='/var/www/wordpress';
    do
    sleep 2
    done

    wp core install --url=${DOMAIN_NAME} --title="Inception"   \
        --admin_user=${WP_ADMIN_UNAME}                    \
        --admin_password=${WP_ADMIN_PASS}            \
        --admin_email=${WP_ADMIN_EMAIL}

    wp user create ${WP_AUTHOR_UNAME} ${WP_AUTHOR_EMAIL}        \
        --user_pass=${WP_AUTHOR_PASS}                       \
        --role=author
fi

/usr/sbin/php-fpm81 -F