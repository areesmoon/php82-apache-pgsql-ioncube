FROM php:8.2-apache

ARG IONCUBE_VERSION=12.1.3

RUN apt-get update && apt-get install -y \
    wget unzip libicu-dev libpq-dev socat \
    && docker-php-ext-install intl pdo_pgsql pgsql \
    && wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar xzf ioncube_loaders_lin_x86-64.tar.gz \
    && cp ioncube/ioncube_loader_lin_8.2.so $(php -r "echo ini_get('extension_dir');")/ioncube_loader_lin_8.2.so \
    && echo "zend_extension=ioncube_loader_lin_8.2.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm -rf ioncube ioncube_loaders_lin_x86-64.tar.gz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

COPY apache-ci4.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["/bin/sh", "-c", "socat TCP-LISTEN:55575,fork,reuseaddr TCP:db:5432 & apache2-foreground"]
