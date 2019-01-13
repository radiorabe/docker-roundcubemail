#!/bin/bash

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then
  echo "Write config to /usr/src/roundcubemail/plugins/singleuserautologin/config.inc.php"
  echo "<?php
  \$config['singleuserautologin_username'] = '${ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_USERNAME}';
  \$config['singleuserautologin_password'] = '${ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_PASSWORD}';
  " > /usr/src/roundcubemail/plugins/singleuserautologin/config.inc.php
fi

exec /docker-entrypoint.sh "$@"
