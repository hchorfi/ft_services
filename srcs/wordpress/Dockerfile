FROM alpine:3.11
VOLUME [ "/sys/fs/cgroup" ]
COPY install.sh /
COPY nginx.conf /
COPY index.php /
COPY services.sh /
COPY www.conf /
COPY php.ini /
COPY wp-config.php /
RUN sh install.sh
COPY telegraf.conf /etc/telegraf.conf
COPY check.sh /
EXPOSE 5050
ENTRYPOINT [ "sh", "services.sh" ]