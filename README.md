# RaBe roundcubemail container image

This repo contais a container image based on the [official roundcubemail image](https://github.com/roundcube/roundcubemail-docker)
that contains our [singleuserlogin](https://github.com/radiorabe/roundcube-singleuserlogin) and the assets needed to run it.

## Usage

```bash
docker run \
  -p 8080:80 \
  -e ROUNDCUBEMAIL_DEFAULT_HOST=tls://imap.mail.example.com \
  -e ROUNDCUBEMAIL_SMTP_SERVER=tls://smtp.mail.example.com \
  -e ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_USERNAME=email@example.com \
  -e ROUNDCUBEMAIL_SINGLEUSERAUTOLOGIN_PASSWORD=password \
  radiorabe/roundcubemail
```

You may now connect to `http://localhost:8080/?_autologin=true` and the configured user
will automatically get logged in to roundcube without exposing the password passed via
the environment.
