FROM alpine:latest

RUN apk update \
    && apk add \
        curl \
        bind-tools \
        busybox-extras \
    && rm -rf /var/cache/apk/*
