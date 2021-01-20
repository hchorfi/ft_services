#!/bin/bash

if [ $1 = "clean" ]; then
    docker stop mysql nginx wordpress phpmyadmin
    docker rm mysql nginx wordpress phpmyadmin
    docker rmi mysql nginx wordpress phpmyadmin
elif [ $1 = "start" ]; then
    docker start nginx mysql wordpress phpmyadmin
elif [ $1 = "stop" ]; then
    docker stop nginx mysql wordpress phpmyadmin
elif [ $1 = "clean-wp" ]; then
    docker stop wordpress
    docker rm wordpress
elif [ $1 = "re-wp" ]; then
    docker run -d --name wordpress -p 5050:5050 wordpress
else
    docker build -t nginx ./srcs/nginx
    docker build -t mysql ./srcs/mysql
    docker build -t wordpress ./srcs/wordpress
    docker build -t phpmyadmin ./srcs/phpmyadmin
    docker volume create data-dir
    docker run -d --name nginx -p 80:80 -p 443:443 -p 2222:22 nginx
    docker run -d --name mysql -v data-dir:/var/lib/mysq -p 3306:3306 mysql
    docker run -d --name wordpress -p 5050:5050 wordpress
    docker run -d --name phpmyadmin -p 5000:5000 phpmyadmin
fi
