FROM php:8.2-cli

WORKDIR /app

# System deps
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
 && docker-php-ext-install \
    mbstring \
    zip \
    xml \
    opcache \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy only composer files first (better caching)
COPY composer.json composer.lock* /app/

# Install deps WITHOUT scripts (important)
RUN composer install \
    --no-dev \
    --no-scripts \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# Copy rest of the project
COPY . /app

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
