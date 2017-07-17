FROM alpine:latest
MAINTAINER Johnny Huynh <johnnyhuynhdev@gmail.com>

# Update existing packages
RUN apk update && apk upgrade

RUN \
    # Core utils
    echo -e "\nInstalling Core utilities..." && \
    apk add \
        curl \
        unzip  && \

    # PHP 7
    echo -e "\nInstalling PHP 7..." && \
    apk add \
        php7 \
        php7-zlib \
        php7-json \
        php7-apache2 \
        php7-ctype \
        php7-session \
        php7-dom \
        php7-openssl \
        php7-mbstring \
        php7-phar \
        php7-pdo \
        php7-tokenizer \
        php7-xml \
        php7-xmlwriter \
        php7-zip \
        php7-mysqli && \

    # PHP Composer
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    echo -e "\nInstalling Composer..." && \
    php /tmp/composer-setup.php --install-dir=bin --filename=composer && \
    echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' > ~/.bashrc && \
    source ~/.bashrc && \

    # Apache2
    apk add \
        apache2 \
        apache2-utils && \
    mkdir -p /run/apache2 && \
    sed -i 's$^#ServerName.*$ServerName localhost:80$' /etc/apache2/httpd.conf && \
    sed -i 's$/var/www/localhost/htdocs$/var/www/laravel/public$' /etc/apache2/httpd.conf && \

    # NodeJS/npm
    echo -e "\nInstalling NodeJS & npm..." && \
    apk add \
        nodejs \
        nodejs-npm && \
    echo -e "\nUpdating npm, this may take a few minutes..." && \
    npm i -g npm

# Clear cache
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Add laravel project root (make sure Dockerfile is in Laravel project root folder)
ADD . /var/www/laravel
WORKDIR /var/www/laravel

# Install project dependancies
RUN \
    echo -e "\nInstalling project dependancies..." && \
    cd /var/www/laravel && \
    composer install && \
    npm install

# Start apache service in foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Open web ports
EXPOSE 80 443