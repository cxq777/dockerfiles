FROM openresty/openresty:alpine

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh \
    && apt-get update \
    && apt-get install -y inotify-tools

EXPOSE 80 443

CMD ["/bin/bash", "entrypoint.sh"]