# Use official PHP image with Apache server
FROM php:8.1-apache

# Install necessary dependencies
RUN apt-get update && apt-get install -y apt-utils cron curl nano libzip-dev libfreetype6-dev \
    libjpeg62-turbo-dev libpng-dev libonig-dev libapache2-mod-security2 zip

# Install PHP extensions
RUN docker-php-ext-install zip gd mbstring pdo pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite headers

# Set environment variables
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data

# Set working directory in the container
WORKDIR /var/www/html

# Copy the CodeIgniter project into the container
COPY . /var/www/html/

# Set file permissions for Apache server
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose ports 80 and 81 for HTTP and additional services if needed
EXPOSE 80
EXPOSE 81

# Start Apache server
CMD ["apache2-foreground"]
