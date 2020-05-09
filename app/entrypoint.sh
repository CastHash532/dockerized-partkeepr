#!/bin/sh

php-fpm7 &
nginx -g "daemon off;" &
chown -R www-data:www-data /var/www
