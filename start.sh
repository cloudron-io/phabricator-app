#!/bin/bash

set -eu -o pipefail

mkdir -p /run/phabricator

sed -e "s/##MYSQL_DATABASE_PREFIX/${MYSQL_DATABASE_PREFIX}/" \
    -e "s/##MYSQL_USERNAME/${MYSQL_USERNAME}/" \
    -e "s/##MYSQL_PASSWORD/${MYSQL_PASSWORD}/" \
    -e "s/##MYSQL_HOST/${MYSQL_HOST}/" \
    -e "s/##MYSQL_PORT/${MYSQL_PORT}/" \
    -e "s,##APP_ORIGIN,${APP_ORIGIN}," \
    -e "s,##MAIL_SERVER,${MAIL_SMTP_SERVER}," \
    -e "s,##MAIL_PORT,${MAIL_SMTP_PORT}," \
    -e "s/##MAIL_FROM/${MAIL_SMTP_USERNAME}@${MAIL_DOMAIN}/" \
    -e "s/##MAIL_DOMAIN/${MAIL_DOMAIN}/" \
    /app/code/phabricator/conf/local/local.json.template > /run/phabricator/local.json

chown -R cloudron:cloudron /run/phabricator

# https://secure.phabricator.com/book/phabricator/article/configuring_file_storage/
mkdir -p /app/data/filestorage /app/data/repo
chown -R www-data:www-data /app/data

/app/code/phabricator/bin/storage upgrade --force
/app/code/phabricator/bin/phd start

echo "Starting apache"
APACHE_CONFDIR="" source /etc/apache2/envvars
rm -f "${APACHE_PID_FILE}"
exec /usr/sbin/apache2 -DFOREGROUND

