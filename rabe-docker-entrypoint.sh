#!/bin/bash

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then
  if [ ! -e /usr/src/roundcubemail/plugins/singleuserautologin/config.inc.php ]; then
    echo "Write config to /var/roundcube/config/singleuserautologin.php"
    echo "<?php
    \$config['singleuserautologon_hostname'] = '${ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_HOSTNAME}';
    \$config['singleuserautologon_username'] = '${ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_USERNAME}';
    \$config['singleuserautologon_password'] = '${ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_PASSWORD}';
    " >  /usr/src/roundcubemail/plugins/singleuserautologin/config.inc.php
  else
    echo "WARNING: /usr/src/roundcubemail/plugins/singleuserautologin/config.inc.php already exists."
    echo "ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_* environment variables have been ignored."
  fi
fi

exec /docker-entrypoint.sh "$@"
