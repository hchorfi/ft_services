FROM alpine:3.11
VOLUME [ "/sys/fs/cgroup" ]
COPY install.sh /
COPY services.sh /
RUN sh install.sh
COPY telegraf.conf /etc/telegraf.conf
COPY check.sh /
EXPOSE 8086
ENTRYPOINT [ "sh", "services.sh" ]
