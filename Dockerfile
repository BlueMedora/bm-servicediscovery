FROM gliderlabs/alpine
MAINTAINER Blue Medora devops@bluemedora.com

RUN apk --update add nmap nmap-scripts nmap-nselibs && rm -f /var/cache/apk/*

RUN mkdir /work
VOLUME ["/work"]
WORKDIR /work

ENTRYPOINT ["nmap"]

