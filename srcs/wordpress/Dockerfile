FROM alpine:3.12

RUN apk update ;\
apk add nginx ;\
apk add openssl; \
apk add php7 php7-fpm php7-opcache php7-json;\
apk add php7-openssl php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib;\
apk add mysql-client;\
apk add curl ;\
apk add php-phar ;\
apk add php-iconv ;\
mkdir -p /usr/share/nginx/html ;\
mkdir -p /run/nginx ;

COPY ./srcs/default.conf /etc/nginx/conf.d/
COPY ./srcs/wordpress wordpress
COPY ./srcs/setup.sh .
COPY ./srcs/install_wp.sh .
COPY ./srcs/start.sh .
RUN sh setup.sh
EXPOSE 443
CMD ["sh", "start.sh"]
