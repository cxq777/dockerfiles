FROM openresty/openresty:alpine

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh \
    && apk update \
    && apk add inotify-tools

EXPOSE 80 443

CMD ["/bin/bash", "entrypoint.sh"]