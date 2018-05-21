FROM resin/rpi-raspbian

RUN apt update && apt install wget apache2 php5-common libapache2-mod-php5 php5-cli php5-curl
RUN cd /var/www && wget -qO- https://repository.rainloop.net/installer.php | php
RUN cd /var/www/rainloop && find . -type d -exec chmod 755 {} \; && find . -type f -exec chmod 644 {} \; && chown -R www-data:www-data . && cd .. && mv data html/data && mv rainloop html/rainloop && mv index.php html/index.php && cd html && rm index.html
# RUN mkdir -p /var/www/html/mail
# RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www

# ENTRYPOINT tail -f /dev/null && wget -qO- https://repository.rainloop.net/installer.php | php && service apache2 start && apache2ctl configtest 
# ENTRYPOINT service apache2 start && apache2ctl configtest && tail -f /dev/null
# ENTRYPOINT wget -qO- https://repository.rainloop.net/installer.php | php && cd /var/www/rainloop && find . -type d -exec chmod 755 {} \; && find . -type f -exec chmod 644 {} \; && chown -R www-data:www-data . && service apache2 start && tail -f /dev/null
ENTRYPOINT service apache2 start && tail -f /dev/null

EXPOSE 80 143 993 25 8080 106