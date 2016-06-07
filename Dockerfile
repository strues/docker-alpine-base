FROM alpine:3.4
MAINTAINER Steven Truesdell <steven@strues.io>

ENV \
  TIMEZONE=America/Denver \
  LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8

# Basic setup.
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update \
    && apk upgrade \
    && apk add --no-cache --update bash shadow curl wget tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    # `app` user and group with OS X-compatible IDs
    && addgroup -g 50 app \
    && adduser -D -G app -s /bin/bash -u 1000 app \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /app \
    && chmod -R 755 /app \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm -rf /var/log/*

VOLUME /app
WORKDIR /app

CMD []
