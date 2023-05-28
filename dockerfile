# Stage 1: Build the Laravel app
FROM composer:2 as builder

# Set working directory
WORKDIR /app

# Copy the composer files
COPY composer.* ./

# Install dependencies
RUN composer install --optimize-autoloader --no-dev

# Copy the rest of the application
COPY . .

# Generate the optimized class loader
RUN composer dump-autoload --optimize --classmap-authoritative

# Build the production assets (optional)
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Stage 2: Create a lightweight production image
FROM php:8.0-fpm-alpine

# Install dependencies
RUN apk --no-cache add \
    nginx \
    supervisor \
    curl

# Copy the Laravel app from the previous stage
COPY --from=builder /app /var/www/html

# Copy nginx configuration
COPY deploy/nginx.conf /etc/nginx/nginx.conf

# Copy supervisor configuration
COPY deploy/supervisord.conf /etc/supervisord.conf

# Set up writable directories
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose the HTTP port
EXPOSE 80

# Set the entrypoint to start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

