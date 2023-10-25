FROM php:8.1-apache
COPY . /var/www/html/
RUN apt-get update && \
  apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libzip-dev libicu-dev libonig-dev libxslt1-dev curl libcurl4-openssl-dev zip unzip wget iputils-ping mariadb-client && \
  docker-php-ext-install iconv && \
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install gd && \
  docker-php-ext-install soap xsl zip pdo_mysql mysqli mbstring intl && \
  a2enmod rewrite && \
  service apache2 restart
EXPOSE 80
EXPOSE 443
CMD ["apache2-foreground"]