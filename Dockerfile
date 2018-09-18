FROM ubuntu:14.04
LABEL maintainer="dylan@arcadiandigital.com.au"

RUN apt-get update
RUN apt-get install apache2 php5-mysql mysql-client php5 libapache2-mod-php5 php5-mcrypt php5-cli -y

RUN a2enmod php5
RUN a2enmod rewrite

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# COPY magento /var/www/html
# COPY info.php /var/www/html/info.php
# RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND