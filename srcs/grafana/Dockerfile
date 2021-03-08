FROM alpine:3.12

RUN apk update ;\
apk add grafana --repository='http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/';

EXPOSE 3000
COPY start.sh .
COPY grafana.ini .
CMD ["sh", "start.sh"]
