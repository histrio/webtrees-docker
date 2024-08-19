FROM php:8.3.10-fpm-alpine3.20

ARG WEBTREES_VERSION=2.1.20

RUN set -e \
    && apk add --no-cache freetype libpng libjpeg-turbo ca-certificates openssl libpng-dev libjpeg-turbo-dev freetype-dev icu-dev zip libzip-dev postgresql-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo mysqli pdo_mysql pgsql pdo_pgsql intl zip \
    && wget https://github.com/fisharebest/webtrees/releases/download/$WEBTREES_VERSION/webtrees-$WEBTREES_VERSION.zip \
    && unzip webtrees-$WEBTREES_VERSION.zip -d /var/www/html \
    && mv /var/www/html/webtrees/* /var/www/html/ \
    && rm -rf /var/www/html/webtrees \
    && rm webtrees-$WEBTREES_VERSION.zip \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
