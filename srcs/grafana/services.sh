#! /bin/sh
openrc default
cd /usr/share/grafana
/usr/sbin/grafana-server web
rc-status -a
exec top