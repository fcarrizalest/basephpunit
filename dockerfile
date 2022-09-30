FROM php:7.4-apache
COPY html/ /var/www/html/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN apt update
RUN apt upgrade -y 


RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN apt install -y zip

RUN useradd -m fcarrizales --uid=1000 && echo "fcarrizalest:123" 
# Setup default user, when enter docker container
USER 1000:1000



