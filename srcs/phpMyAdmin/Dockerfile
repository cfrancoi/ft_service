FROM alpine:3.12

RUN apk update ;\
apk add nginx ;\
apk add openssl; \
apk add php7 php7-fpm php7-opcache php7-json;\
apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom;\
apk add mysql mysql-client php-mysqli php7-session;\
apk add wget; \
mkdir -p /usr/share/nginx/html ;\
mkdir -p /run/nginx ;

COPY ./srcs/default.conf /etc/nginx/conf.d/

COPY ./srcs/setup.sh .
COPY ./srcs/config.inc.php .
COPY ./srcs/phpmyadmin phpmyadmin
COPY ./srcs/start.sh .
RUN sh setup.sh
EXPOSE 443
CMD ["sh", "start.sh"]
