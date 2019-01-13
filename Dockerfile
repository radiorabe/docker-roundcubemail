FROM roundcube/roundcubemail

RUN apt-get update \
 && apt-get install -y \
    git \
 && rm -rf /var/lib/apt/lists/*

COPY --from=composer:1.8.0 /usr/bin/composer /usr/bin/composer

RUN export COMPOSER_ALLOW_SUPERUSER=1 \
 && cd /usr/src/roundcubemail \
 && composer require 'radiorabe/singleuserautologin:^0 || ^1' \
 && composer install --no-dev

COPY rabe-docker-entrypoint.sh /rabe-docker-entrypoint.sh

ENV ROUNDCUBEMAIL_PLUGINS=archive,zipdownload,singleuserautologin

ENTRYPOINT ["/rabe-docker-entrypoint.sh"]
CMD ["apache2-foreground"]
