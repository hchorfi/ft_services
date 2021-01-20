#!/bin/bash
openrc default
rc-status -a
/etc/init.d/mariadb setup
mariadb -u root -e "CREATE USER 'hchorfi'@'localhost' IDENTIFIED BY 'hchorfi';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'hchorfi'@'172.17.0.%' IDENTIFIED BY 'hchorfi';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -e "CREATE DATABASE wordpress;"
mariadb -u root -e "CREATE DATABASE phpmyadmin;"
mariadb -u root -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mariadb -u root -e "CREATE USER 'wpuser'@'172.17.0.%' IDENTIFIED BY 'password';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'172.17.0.%';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root wordpress < wpdbexport.sql
mariadb -u root phpmyadmin < phpmyadmin.sql
exec top
