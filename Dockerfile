FROM titpetric/netdata:latest

ADD scripts/rancher-run.sh /rancher-run.sh

RUN chmod +x /rancher-run.sh \
 && mkdir -p /netdata-config \
 && chown -R root:root /rancher-run.sh /netdata-config

ADD netdata.conf /netdata.conf

WORKDIR /
VOLUME /netdata-config

ENV NETDATA_PORT=19999 SSMTP_TLS=YES SSMTP_SERVER=smtp.gmail.com SSMTP_PORT=587 SSMTP_HOSTNAME=localhost
EXPOSE $NETDATA_PORT

ENTRYPOINT ["/rancher-run.sh"]
