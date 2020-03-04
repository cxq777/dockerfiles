FROM node:12-alpine

COPY .npmrc /root/

RUN apk update && apk upgrade && \
    apk add --no-cache git