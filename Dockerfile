FROM php:7.3.7-fpm-alpine3.10

ENV WEBTREES_VERSION 1.7.14

RUN set -e \
    && apk add --no-cache freetype libpng libjpeg-turbo ca-certificates openssl libpng-dev libjpeg-turbo-dev freetype-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd pdo mysqli pdo_mysql \
    && wget https://github.com/fisharebest/webtrees/archive/$WEBTREES_VERSION.tar.gz \
    && tar -xzf $WEBTREES_VERSION.tar.gz --strip-components=1 \
    && rm $WEBTREES_VERSION.tar.gz 

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
