FROM alpine:3.17.5

LABEL maintainer="kamin"

RUN apk update
RUN apk add --no-cache mysql \
    mysql-client

COPY tools/create_db.sh /tmp

RUN rm /etc/my.cnf
COPY conf/my.cnf /etc/my.cnf

RUN mkdir /var/run/mysqld \
  && touch /var/run/mysqld/mysqld.pid \
  && touch /var/run/mysqld/mysqld.sock \
  && chown -R mysql:root /var/run/mysqld \
  && chown -R mysql:root /etc/mysql \
  && chown -R mysql:root /etc/my.cnf.d

EXPOSE 3306

RUN chown -R mysql:mysql /var/lib/mysql


ENTRYPOINT ["sh" , "/tmp/create_db.sh"]

USER mysql