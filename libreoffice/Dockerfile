FROM openjdk:8-jre-alpine
#set enviroments
ENV TIMEZONE="Asia/Shanghai" \
    VERSION=5.4.5
#install software
RUN apk update && \
    apk add tzdata \
    libreoffice \
    fontconfig \
    ttf-dejavu && \
    fc-cache --farce && \
#Cleaning up
#   apk del tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    rm -rf /var/cache/apk/*
#forwarding port
EXPOSE 8001
VOLUME ["/usr/share/fonts/msfonts"]
#set default command
ENTRYPOINT ["/usr/bin/soffice","--headless"]
CMD ["--norestore","--accept='socket,host=0,port=8001,tcpNoDelay=1;urp;'"]