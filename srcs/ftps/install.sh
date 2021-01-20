#! /bin/sh
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
apk update && apk upgrade

apk add openrc --no-cache
rc-status -a
touch /run/openrc/softlevel

apk add vsftpd telegraf

addgroup hchorfi
adduser -D -G hchorfi -h /home/hchorfi -s /bin/false hchorfi
echo "hchorfi:hchorfi" | /usr/sbin/chpasswd
chown hchorfi:hchorfi /home/hchorfi/ -R

rc-update add telegraf default
rc-update add vsftpd default

apk add openssl
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=MA/ST=BENG/L=BENG/O=LEET/CN=FTPS"
