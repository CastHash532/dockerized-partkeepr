FROM autodoc/php7.1-apache
                    

RUN apt-get -q update && \
apt-get install -y php7.1-gd php7.1-intl php7.1-xsl php7.1-mbstring php7.1-curl php7.1-ldap php7.1-bcmath  php7.1-dom

COPY entrypoint.sh /entrypoint.sh
CMD [ "/entrypoint.sh" ]
