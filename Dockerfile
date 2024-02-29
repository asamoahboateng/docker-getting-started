FROM php:8.2-fpm

# # Arguments defined in docker-compose.yml
# ARG user
# ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:2.7.1 /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user
RUN mkdir -p ~/.composer 

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN set -eux

# COPY docker-compose/startup/dockerrun.sh /usr/bin/local/dockerrun.sh

# RUN chmod +x /usr/bin/local/dockerrun.sh

# RUN /usr/bin/local/dockerrun.sh
# RUN composer install

# RUN php artisan migrate
# ENTRYPOINT ["dockerrun.sh"]

WORKDIR /var/www



