FROM prom/alertmanager:v0.14.0

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--config.file=/etc/alertmanager/config.yml"]

ADD entrypoint.sh /
ADD config.yml /etc/alertmanager/
