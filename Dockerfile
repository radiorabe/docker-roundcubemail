FROM roundcube/roundcubemail

RUN apt-get update \
 && apt-get install -y \
    git \
    unzip \
 && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.5.1 /usr/bin/composer /usr/bin/composer

RUN export COMPOSER_ALLOW_SUPERUSER=1 \
 && cd /usr/src/roundcubemail \
 && cp composer.json-dist composer.json \
 && composer require --update-no-dev \
    'radiorabe/singleuserautologin:^0 || ^1' \
    'marneu/logout_redirect:dev-master@dev'

COPY rabe-docker-entrypoint.sh /rabe-docker-entrypoint.sh

ENV ROUNDCUBEMAIL_PLUGINS=archive,zipdownload,singleuserautologin,logout_redirect

ENTRYPOINT ["/rabe-docker-entrypoint.sh"]
CMD ["apache2-foreground"]
