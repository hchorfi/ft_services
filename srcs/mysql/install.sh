#!/bin/sh
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
apk update && apk upgrade

apk add openrc --no-cache
rc-status -a
touch /run/openrc/softlevel

apk add mariadb mariadb-client
rc-update add mariadb default
mv /mariadb-server.cnf etc/my.cnf.d/mariadb-server.cnf

apk --no-cache add telegraf
rc-update add telegraf default
