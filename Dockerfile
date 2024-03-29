FROM php:8.0-apache

ENV APP_HOME /var/www/html

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpq-dev \
    libmcrypt-dev \
    git \
    zlib1g-dev \
    unzip \
    libc-client-dev libkrb5-dev \
    libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev \
    libonig-dev \
    libpng-dev \
    libzip-dev
RUN rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure gd --enable-gd --with-webp --with-jpeg --with-xpm --with-freetype
RUN  docker-php-ext-install \
    intl \
    mbstring \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    zip \
    opcache \
    mysqli \
    imap \
    bcmath \
    gd

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN sed -i -e "s/html/html/g" /etc/apache2/sites-enabled/000-default.conf

RUN a2enmod rewrite

COPY . $APP_HOME

RUN chown -R www-data:www-data $APP_HOME
