FROM alpine:3.12

RUN apk update ;\
apk add grafana --repository='http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/';\
mkdir -p /usr/share/grafana/conf/provisioning/datasources ;\
mkdir -p /usr/share/grafana/conf/provisioning/dashboards


EXPOSE 3000
COPY start.sh .
COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources
COPY dash.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY grafana.ini .
CMD ["sh", "start.sh"]
