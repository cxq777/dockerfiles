FROM alpine:latest as downloader

ARG DOCKER_CLI_VERSION="18.06.3-ce"
ENV DOCKER_DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

ARG KUBE_VERSION="1.16.3"
ENV KUBE_DOWNLOAD_URL="https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl"
# ENV KUBE_DOWNLOAD_URL="https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

ARG MAVEN_VERSION="3.6.3"
ENV MAVEN_DOWNLOAD_URL="http://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"

ENV NODE_VERSION 12.13.1

# install
RUN apk --no-cache add curl \
    && curl -L $DOCKER_DOWNLOAD_URL | tar -xz docker \
    && mv docker/docker /usr/local/bin/docker \
    && curl -L $KUBE_DOWNLOAD_URL -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
	&& mkdir -p /usr/share/maven \
    && curl -L $MAVEN_DOWNLOAD_URL | tar -xz -C /usr/share/maven --strip-components=1


FROM node:10-alpine

COPY --from=downloader /usr/local/bin/docker /usr/local/bin/docker
COPY --from=downloader /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=downloader /usr/share/maven /usr/share/maven

ENV MAVEN_HOME /usr/share/maven
ENV LANG C.UTF-8
# ENV JAVA_VERSION 8u212
ENV JAVA_ALPINE_VERSION 8.222.10-r0

RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN set -x \
	&& apk add --no-cache \
		openjdk8="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

# ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "docker -v; kubectl version; java -version; mvn -version; node -v; npm -v;"]