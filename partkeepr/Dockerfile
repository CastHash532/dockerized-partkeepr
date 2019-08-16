FROM alpine:3.7

# Update APK
RUN apk update

# Add php7
RUN apk add php7 php7-apcu php7-ctype php7-curl php7-dom php7-fileinfo php7-fpm php7-gd php7-iconv php7-intl php7-json php7-ldap php7-mbstring php7-mysqli php7-pdo_mysql php7-session php7-simplexml php7-tokenizer php7-xml

# Add NGINX
RUN apk add nginx

# Create www-data user
RUN adduser www-data -H -D -G www-data

# Copy Application
RUN wget https://downloads.partkeepr.org/partkeepr-1.4.0.zip && \
    unzip -qq partkeepr-1.4.0.zip -d /var/www/ && \
    rm -f partkeepr-1.4.0.zip
RUN mv /var/www/partkeepr-1.4.0 /var/www/partkeepr
RUN chown -R www-data:www-data /var/www

# NGINX Configuration
RUN chown -R www-data:www-data /var/lib/nginx
RUN mkdir -p /run/nginx && echo "" > /run/nginx/nginx.pid
COPY nginx.conf /etc/nginx/

# PHP Configuration
RUN sed -i 's/= nobody/= www-data/g' /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/\;date\.timezone =/date.timezone = America\/Toronto/' /etc/php7/php.ini

# Cron configuration
RUN echo -e "\n0 0,6,12,18 * * * /usr/bin/php /var/www/partkeepr/app/console partkeepr:cron:run" >> /etc/crontabs/root

# PORT
EXPOSE 80

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
CMD [ "/entrypoint.sh" ]