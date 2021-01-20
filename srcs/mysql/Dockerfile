FROM alpine:3.11
VOLUME [ "/sys/fs/cgroup" ]
COPY install.sh /
COPY services.sh /
COPY wpdbexport.sql /
COPY phpmyadmin.sql /
COPY mariadb-server.cnf /
RUN sh install.sh
COPY telegraf.conf /etc/telegraf.conf
COPY check.sh /
EXPOSE 3306
ENTRYPOINT [ "sh", "services.sh" ]