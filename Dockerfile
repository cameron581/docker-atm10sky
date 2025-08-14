# syntax=docker/dockerfile:1

FROM eclipse-temurin:21-jdk

LABEL version="1.0"


RUN apt-get update && apt-get install -y curl unzip jq && \
    adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data
 
EXPOSE 25565/tcp

CMD ["/launch.sh"]
 
