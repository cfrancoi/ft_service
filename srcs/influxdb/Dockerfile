FROM alpine:3.11.7
COPY config.conf .
COPY influx.conf .
RUN apk update ;\
apk add openrc;\
apk add wget;\
apk add influxdb; \
apk add telegraf --repository='http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/';\
mkdir './data'


COPY start.sh .
EXPOSE 8086
CMD ["sh", "start.sh"]
