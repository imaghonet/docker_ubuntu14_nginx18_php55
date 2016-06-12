# Pull base image.
FROM imaghonet/ubuntu14_nginx18

# drop in some info
LABEL pl.imagho.image.version="1.1" \
      pl.imagho.image.description="Ubuntu 14.4, Nginx 1.8, PHP 5.5" \
      pl.imagho.image.os="ubuntu14" \
      pl.imagho.image.php.version="5.5" \
      pl.imagho.image.php.opcode="xcache" \
      pl.imagho.image.php.cache="" \
      pl.imagho.image.webserver.name="nginx" \
      pl.imagho.image.webserver.version="1.8"

MAINTAINER imaghonet <sysops@imagho.net>

# Upgrade layer.
RUN \
  apt-get update && \
  apt-get upgrade -y

# Install PHP layer.
RUN apt-get install -y --fix-missing php5-fpm && \
  apt-get install -y \
    php5-mysql php5-mongo php5-pgsql \
    php5-memcache php5-memcached php5-xcache \
    php5-intl php5-curl php5-gd php-pear php5-imagick php5-imap php5-mcrypt php5-tidy php5-xmlrpc php5-xsl && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  php5enmod imap

# Install CMD layer.
RUN echo '#!/bin/bash \n\
/usr/sbin/php5-fpm && /usr/sbin/nginx \n\
while [ $(pidof php5-fpm | wc -w) -ge 1 ] && [ $(pidof nginx | wc -w) -ge 1  ]; do \n\
  sleep 2 \n\
done \n\
exit 1' > /run_php5fpm_nginx.sh && \
  chmod 755 /run_php5fpm_nginx.sh

CMD ["/run_php5fpm_nginx.sh"]