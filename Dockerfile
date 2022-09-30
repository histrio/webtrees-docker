FROM php:8.1.11-fpm-alpine3.16

ENV WEBTREES_VERSION 2.1.7

RUN set -e \
    && apk add --no-cache freetype libpng libjpeg-turbo ca-certificates openssl libpng-dev libjpeg-turbo-dev freetype-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo mysqli pdo_mysql \
    && wget https://github.com/fisharebest/webtrees/archive/$WEBTREES_VERSION.tar.gz \
    && tar -xzf $WEBTREES_VERSION.tar.gz --strip-components=1 \
    && rm $WEBTREES_VERSION.tar.gz 

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
