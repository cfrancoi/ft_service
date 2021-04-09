FROM alpine:3.11.7
COPY ./srcs/config.conf .
COPY ./srcs/influx.conf .
RUN apk update ;\
apk add openrc;\
apk add wget;\
apk add influxdb; \
apk add telegraf --repository='http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/';\
mkdir './data' ;\
mkdir './certs'


COPY ./srcs/start.sh .
EXPOSE 8086
CMD ["sh", "start.sh"]
