FROM alpine:3.11.7


RUN apk update ;\
apk add mysql mysql-client --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main;\
apk add openrc;\
apk add wget;\
mkdir './data'

COPY start.sh .
COPY install_db.sh .
COPY mariadb.cnf .
COPY wp.sql .
COPY gra.sql .
RUN chmod +x install_db.sh
EXPOSE 3306
CMD ["sh", "start.sh"]
