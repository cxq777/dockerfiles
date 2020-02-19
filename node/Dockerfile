FROM node:12-alpine

COPY .npmrc /home/node/

RUN apk update && apk upgrade && \
    apk add --no-cache git