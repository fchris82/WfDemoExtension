FROM php:7.4-alpine

# We need docker and xdebug!
RUN apk --no-cache add docker-cli git $PHPIZE_DEPS && \
    pecl install xdebug && docker-php-ext-enable xdebug && \
    apk del --purge $PHPIZE_DEPS && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require hirak/prestissimo
