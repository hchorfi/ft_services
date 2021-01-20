#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
apk update && apk upgrade

apk add openrc --no-cache
rc-status -a
touch /run/openrc/softlevel
apk add nginx
mkdir /www
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /nginx.conf /etc/nginx
mv /nginx-selfsigned.crt /etc/ssl/certs/
mv /nginx-selfsigned.key /etc/ssl/private/
mv /index.html /www
rc-update add nginx default
#-----------------------------------------
apk add openssh
mv sshd_config /etc/ssh/sshd_config
rc-update add sshd
rc-status
rc-service sshd start
echo "root:root" | chpasswd
rc-update add sshd default
#------------------------------------------
apk --no-cache add telegraf
rc-update add telegraf default
