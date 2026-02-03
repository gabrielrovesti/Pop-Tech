FROM php:8.2-apache

# Install PHP extensions needed by the project
RUN docker-php-ext-install mysqli

# Enable Apache modules and allow .htaccess overrides
RUN a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy project files
COPY . /var/www/html

# Ensure correct permissions for Apache
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
