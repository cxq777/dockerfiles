FROM openresty/openresty:alpine

COPY entrypoint.sh entrypoint.sh

RUN apk update \
    && apk add --no-cache \
        tzdata \
        inotify-tools \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && chmod +x entrypoint.sh \
    && rm -rf /var/cache/apk/*

EXPOSE 80 443

CMD ["/bin/sh", "entrypoint.sh"]