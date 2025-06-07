# Use official PHP + Apache image
FROM php:8.2-apache

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Copy your PHP project to Apache web root
COPY . /var/www/html/

# Set correct permissions (optional)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
