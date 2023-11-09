FROM alpine:3.17.5

LABEL maintainer="kamin"

RUN apk update

#installing required packages
RUN apk add --no-cache nginx openssl zsh curl wget git

RUN mkdir /etc/nginx/ssl



#Certificate details
#Encryption: 4096-bit RSA
#Algorithm: sha256
#Validity: 365 days
#Private key encryption: disabled
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/kamin.crt \
       -keyout /etc/nginx/ssl/kamin.key \
       -subj "/C=AE/ST=AD/L=Abu Dhabi/O=42AD"

RUN mkdir -p /var/run/nginx


COPY ./config/nginx.conf /etc/nginx/

EXPOSE	443


RUN mkdir /var/cache/nginx

RUN chown -R nginx:nginx /var/cache/nginx /etc/nginx

# EXPOSE 443

USER nginx

CMD [ "nginx" , "-g" , "daemon off;" ]