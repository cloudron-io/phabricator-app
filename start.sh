#!/bin/bash

set -eu -o pipefail

mkdir -p /run/phabricator

# Remove _ from the prefix since phabricator adds it anyway
sed -e "s/##MYSQL_DATABASE_PREFIX/${MYSQL_DATABASE_PREFIX%_}/" \
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

# import the database with default 'superadmin' user
if [[ ! -f /app/data/imported ]]; then
    echo "Importing initial data"
    sed -e "s/\`c426f39125b21bba_/\`${MYSQL_DATABASE_PREFIX}/" /app/code/dump_71bda66870d8ef832f.sql | mysql -u"${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" -h "${MYSQL_HOST}" -P "${MYSQL_PORT}"
    touch /app/data/imported
else
    echo "Already initialized"
fi

echo "Upgrading database"
/app/code/phabricator/bin/storage upgrade --force

readonly ldap_config="{\"ldap:port\":\"${LDAP_PORT}\",\"ldap:version\":\"3\",\"ldap:host\":\"${LDAP_SERVER}\",\"ldap:dn\":\"${LDAP_USERS_BASE_DN}\",\"ldap:search-attribute\":\"cn\",\"ldap:anoynmous-username\":\"${LDAP_BIND_DN}\",\"ldap:anonymous-password\":\"${LDAP_BIND_PASSWORD}\",\"ldap:username-attribute\":\"cn\",\"ldap:realname-attributes\":[\"displayname\"],\"ldap:activedirectory-domain\":\"\"}"

# update only on id 2 (id 1 is username/password). this allows the user to disable it
if mysql -u"${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" -h "${MYSQL_HOST}" -P "${MYSQL_PORT}" --database="${MYSQL_DATABASE_PREFIX}auth" \
     -e "UPDATE \`auth_providerconfig\` SET properties='${ldap_config}' WHERE id=2 AND providerClass='PhabricatorLDAPAuthProvider';"; then
    echo "LDAP configuration auto setup successfully"
else
    echo "Failed to setup LDAP authentication"
fi

echo "Starting daemons"
/app/code/phabricator/bin/phd start

echo "Starting apache"
APACHE_CONFDIR="" source /etc/apache2/envvars
rm -f "${APACHE_PID_FILE}"
exec /usr/sbin/apache2 -DFOREGROUND

