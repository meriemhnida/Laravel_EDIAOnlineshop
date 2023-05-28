# Utiliser une image de base contenant PHP et Composer
FROM php:8.0-fpm

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath opcache

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le répertoire de travail dans le conteneur
WORKDIR /var/www/html

# Copier les fichiers de l'application dans le conteneur
COPY . /var/www/html

# Installer les dépendances de l'application
RUN composer install --optimize-autoloader --no-dev

# Définir les variables d'environnement pour la base de données
ENV DB_CONNECTION=mysql
ENV DB_HOST=ybqvvg14edivikmrh7wui-mysql.services.clever-cloud.com
ENV DB_PORT=3306
ENV DB_DATABASE=bqvvg14edivikmrh7wui
ENV DB_USERNAME=u8m1mjdgzts5gwhg
ENV DB_PASSWORD=J7IcYOnNJ4zEry22uOuz

# Exposer le port du serveur web (si nécessaire)
EXPOSE 80

# Définir le point d'entrée du conteneur
CMD php artisan serve --host=0.0.0.0 --port=80
