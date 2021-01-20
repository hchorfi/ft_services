kubectl exec deploy/mysql -- pkill mysqld
kubectl exec deploy/wordpress -- pkill nginx
kubectl exec deploy/phpmyadmin -- pkill php-fpm7
kubectl exec deploy/influxdb -- pkill influxd
kubectl exec deploy/grafana -- pkill telegraf
kubectl exec deploy/ftps -- pkill vsftpd
kubectl exec deploy/nginx -- pkill nginx