#!/bin/sh
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
apk update && apk upgrade

apk add openrc --no-cache
rc-status -a
touch /run/openrc/softlevel
apk add nginx
mkdir /www
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /nginx.conf /etc/nginx
mv /index.php /www
rc-update add nginx default

#--- installing php ---#

apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php-session
<<cmnt
#set env variable
PHP_FPM_USER="www"
PHP_FPM_GROUP="www"
PHP_FPM_LISTEN_MODE="0660"
PHP_MEMORY_LIMIT="512M"
PHP_MAX_UPLOAD="50M"
PHP_MAX_FILE_UPLOAD="200"
PHP_MAX_POST="100M"
PHP_DISPLAY_ERRORS="On"
PHP_DISPLAY_STARTUP_ERRORS="On"
PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR"
PHP_CGI_FIX_PATHINFO=0
mv www.conf /etc/php7/php-fpm.d/
mv php.ini /etc/php7/
cmnt
rc-update add php-fpm7 default

#--- installing wordpress ---#
cd /www
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown -R www:www /www/wordpress
mv /wp-config.php wordpress/wp-config.php

#--------------------------------
apk --no-cache add telegraf
rc-update add telegraf default
