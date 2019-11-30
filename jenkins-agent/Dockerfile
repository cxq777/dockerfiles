FROM alpine:latest as downloader

ARG DOCKER_CLI_VERSION="18.06.3-ce"
ENV DOCKER_DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

ARG KUBE_VERSION="1.16.3"
ENV KUBE_DOWNLOAD_URL="https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl"
# ENV KUBE_DOWNLOAD_URL="https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# install
RUN apk --no-cache add curl \
    && curl -L $DOCKER_DOWNLOAD_URL | tar -xz docker \
    && mv docker/docker /usr/local/bin/docker \
    && curl -L $KUBE_DOWNLOAD_URL -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl


FROM alpine:latest

COPY --from=downloader /usr/local/bin/docker /usr/local/bin/docker
COPY --from=downloader /usr/local/bin/kubectl /usr/local/bin/kubectl

# ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "docker -v; kubectl version;"]