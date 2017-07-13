FROM alpine:latest
MAINTAINER Johnny Huynh <johnnyhuynhdev@gmail.com>

# Copy root folder of OS to project directory root/
COPY root/. /

# Update existing packages
RUN apk update && apk upgrade

# Install openrc for rc service
RUN apk add openrc --no-cache

# Install apache2 and latest PHP
RUN apk add \
    apache2 \
    php7 \
    php7-apache2 \
    php7-openssl \
    php7-mbstring \
    php7-phar \
    php7-pdo \
    php7-tokenizer \
    php7-mysqli

EXPOSE 80
EXPOSE 443

# House cleaning
RUN rm -rf /var/cache/apk/*