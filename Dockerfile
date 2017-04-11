FROM anapsix/alpine-java
MAINTAINER @sedgewickmm18
RUN apk update
RUN apk add bash mosquitto mosquitto-clients
RUN touch /var/log/mosquitto.log && chmod 777 /var/log/mosquitto.log && touch /var/run/mosquitto.pid && chmod 777 /var/run/mosquitto.pid
EXPOSE 1883
ADD docker-entrypoint.sh /usr/bin
ADD . .
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
