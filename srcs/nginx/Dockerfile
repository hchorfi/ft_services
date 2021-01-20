FROM alpine:3.11
VOLUME [ "/sys/fs/cgroup" ]
COPY install.sh /
COPY nginx.conf /
COPY index.html /
COPY nginx-selfsigned.crt /
COPY nginx-selfsigned.key /
COPY sshd_config /
COPY services.sh /
RUN sh install.sh
COPY telegraf.conf /etc/telegraf.conf
COPY check.sh /
EXPOSE 80 443 22
ENTRYPOINT [ "sh", "services.sh" ]
#CMD ["/usr/sbin/sshd","-D"]