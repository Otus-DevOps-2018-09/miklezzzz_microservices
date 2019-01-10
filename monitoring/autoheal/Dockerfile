FROM openshift/origin-base

RUN useradd --no-create-home autoheal

COPY entrypoint.sh /
COPY autoheal /usr/bin/
COPY autoheal.yml /etc/autoheal/ 
RUN chown autoheal: -R /etc/autoheal
EXPOSE 9098

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "server", "--config-file=/etc/autoheal/autoheal.yml", "--kubeconfig=/etc/autoheal/config" ]
