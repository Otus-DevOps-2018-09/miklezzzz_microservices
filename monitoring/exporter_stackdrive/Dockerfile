FROM        quay.io/prometheus/busybox:latest
MAINTAINER  Ferran Rodenas <frodenas@gmail.com>

COPY entrypoint.sh /
COPY stackdriver_exporter /bin/stackdriver_exporter

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--google.project-id", "docker-223515", "--monitoring.metrics-type-prefixes", "compute.googleapis.com/instance/cpu,compute.googleapis.com/instance/disk,compute.googleapis.com/instance/network"]
EXPOSE     9255
