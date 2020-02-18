FROM alpine:latest

RUN apk update \
    && apk add \
        git \
        curl \
        bind-tools \
        busybox-extras \
    && rm -rf /var/cache/apk/*
