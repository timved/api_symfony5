FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    wget \
    zlib1g-dev \
    libmcrypt-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd


RUN docker-php-ext-install pdo pdo_pgsql
RUN apt-get update && apt-get install -y unzip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

WORKDIR /api
