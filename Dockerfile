FROM alpine:latest
MAINTAINER Johnny Huynh <johnnyhuynhdev@gmail.com>

# Update existing packages
RUN apk update && apk upgrade

# Install apache2 and latest PHP
RUN apk add \
    # Core utils
    curl \
    unzip \

    # PHP 7
    php7 \
    php7-zlib \
    php7-json \
    php7-apache2 \
    php7-openssl \
    php7-mbstring \
    php7-phar \
    php7-pdo \
    php7-tokenizer \
    php7-mysqli && \

    # PHP Composer
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    php /tmp/composer-setup.php --install-dir=bin --filename=composer && \

    # Apache2
    apk add \
        apache2 \
        apache2-utils && \
    mkdir -p /run/apache2 && \
    sed -i 's/^#ServerName.*/ServerName localhost:80/' /etc/apache2/httpd.conf

# Clear cache
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Start apache service in foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Open web ports
EXPOSE 80 443