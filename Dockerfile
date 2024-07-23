# Use a imagem oficial do PHP 8.1 com FPM
FROM php:8.1-fpm

# Defina o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    zip \
    unzip \
    git \
    curl \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mbstring pdo pdo_mysql zip xml intl

# Instale o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copie o arquivo de configuração php.ini
COPY ./docker/php.ini /usr/local/etc/php/

# Copie o código da aplicação para o diretório de trabalho
COPY ./src /var/www/html

# Crie os diretórios writable e cache, se não existirem
RUN mkdir -p /var/www/html/writable /var/www/html/cache

# Dê permissões ao diretório de armazenamento e cache
RUN chown -R www-data:www-data /var/www/html/writable /var/www/html/cache

# Exponha a porta 9000, que é a porta padrão do PHP-FPM
EXPOSE 9000

# Comando para iniciar o PHP-FPM
CMD ["php-fpm"]
