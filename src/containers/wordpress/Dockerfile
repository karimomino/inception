FROM alpine:3.17.5

LABEL maintainer="kamin"


RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.14/community" >> /etc/apk/repositories

RUN apk update

#installing required packages
RUN apk add --no-cache \
	wget \
	php \
	php-phar \
	php-fpm \
	php-mysqli \
	php-iconv \
	mariadb-client

RUN	wget https://wordpress.org/wordpress-6.3.2.tar.gz -P /var/www
RUN tar -xvf /var/www/wordpress-6.3.2.tar.gz -C /var/www/

RUN	rm /var/www/wordpress-6.3.2.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN rm /etc/php81/php-fpm.d/www.conf

COPY ./config/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools/setup.sh /tmp/setup.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv /wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress/

#We expose the 9000 port
EXPOSE 9000

ENTRYPOINT [ "sh" , "/tmp/setup.sh" ]

# CMD ["/usr/sbin/php-fpm", "-F"]
