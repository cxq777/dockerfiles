FROM alpine:latest as downloader

ARG DOCKER_CLI_VERSION="18.06.3-ce"
ENV DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

# install docker client
RUN apk --no-cache add curl \
    && curl -L $DOWNLOAD_URL | tar -xz docker \
    && mv docker/docker /usr/local/bin/docker


FROM alpine:latest

COPY --from=downloader /usr/local/bin/docker /usr/local/bin/docker

ENTRYPOINT ["docker"]
CMD ["-v"]