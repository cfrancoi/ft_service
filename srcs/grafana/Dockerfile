FROM alpine:3.12

RUN apk update ;\
apk add grafana --repository='http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/';\
mkdir -p /usr/share/grafana/conf/provisioning/datasources ;\
mkdir -p /usr/share/grafana/conf/provisioning/dashboards ;\
mkdir -p /var/lib/grafana/dashboards ;


EXPOSE 3000
COPY ./srcs/start.sh .
COPY ./srcs/dashboards/* /var/lib/grafana/dashboards/
COPY ./srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources
COPY ./srcs/dash.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY ./srcs/grafana.ini .
CMD ["sh", "start.sh"]
