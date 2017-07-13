FROM alpine:latest
CMD ["/bin/sh"]
MAINTAINER Johnny Huynh <johnnyhuynhdev@gmail.com>

# Update existing packages
RUN apk update && apk upgrade
RUN apk add \
    apache2 \
    php7 \
    php7-apache2 \
    php7-openssl \
    php7-mbstring

EXPOSE 80
EXPOSE 443