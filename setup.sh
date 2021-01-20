# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hchorfi <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/24 13:27:51 by hchorfi           #+#    #+#              #
#    Updated: 2020/11/24 13:27:52 by hchorfi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

### starting minikube
echo "/-----------------------------------------------------------------------/"
echo "/starting minikube"
echo "/-----------------------------------------------------------------------/"
export MINIKUBE_HOME=/goinfre/hchorfi
minikube config set memory 3072
minikube delete
minikube start --driver virtualbox
#minikubeip=$(minikube ip)
#echo $minikubeip
eval $(minikube docker-env)
#sed -i '' "s/192.168.*/$minikubeip-$minikubeip/g" ./srcs/metallb-configmap.yaml
#sed -i '' "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.99.100/g" ./srcs/mysql/wpdbexport.sql
#sed -i '' "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.99.100/g" ./srcs/ftps/vsftpd.conf

minikube addons enable metrics-server

### start dashboard
echo "/-----------------------------------------------------------------------/"
echo "/start minikube dashboard"
echo "/-----------------------------------------------------------------------/"

minikube dashboard &

### deploy MetalLB
echo "/-----------------------------------------------------------------------/"
echo "/deploy MetalLB"
echo "/-----------------------------------------------------------------------/"
kubectl apply -f \
https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f \
https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#On first install only
kubectl create secret generic -n metallb-system memberlist \
--from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb-configmap.yaml

### deploy nginx
echo "/-----------------------------------------------------------------------/"
echo "/deploy nginx"
echo "/-----------------------------------------------------------------------/"
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

### deploy mysql
echo "/-----------------------------------------------------------------------/"
echo "/deploy mysql"
echo "/-----------------------------------------------------------------------/"
docker build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

### deploy wordpress
echo "/-----------------------------------------------------------------------/"
echo "/deploy wordpress"
echo "/-----------------------------------------------------------------------/"
docker build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wp.yaml

### deploy phpmyadmin
echo "/-----------------------------------------------------------------------/"
echo "/deploy phpmyadmin"
echo "/-----------------------------------------------------------------------/"
docker build -t phpmyadmin ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/pma.yaml

### deploy influxdb
echo "/-----------------------------------------------------------------------/"
echo "/deploy influxdb"
echo "/-----------------------------------------------------------------------/"
docker build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

### deploy grafana
echo "/-----------------------------------------------------------------------/"
echo "/deploy grafana"
echo "/-----------------------------------------------------------------------/"
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

### deploy ftps
echo "/-----------------------------------------------------------------------/"
echo "/deploy ftps"
echo "/-----------------------------------------------------------------------/"
docker build -t ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml

