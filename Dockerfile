FROM alpine:3.11

RUN apk update \
    && apk upgrade \
    && apk add \
        bash \
        ca-certificates \
        certbot \
        tini \
    && rm -rf /var/cache/apk/*

RUN update-ca-certificates && \
    ln -s /opt/letsencrypt/bin/certbot.sh /etc/periodic/daily/certbot

ENV PATH="/opt/letsencrypt/bin:$PATH"

#VOLUME /certs
#VOLUME /etc/letsencrypt

ENTRYPOINT ["/sbin/tini", "--", "entrypoint.sh"]
CMD ["run.sh"]

COPY . /opt/letsencrypt/
