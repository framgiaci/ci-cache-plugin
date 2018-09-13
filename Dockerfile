FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y install zip unzip curl

COPY commands.sh /scripts/commands.sh
RUN curl -o /usr/local/bin/cache-tool https://raw.githubusercontent.com/framgiaci/cache-tool/master/dist/cache-tool \
    && chmod +x /usr/local/bin/cache-tool
RUN ["chmod", "+x", "/scripts/commands.sh"]

RUN mkdir /cache

ENTRYPOINT ["/scripts/commands.sh"]

WORKDIR /project
