FROM alpine

#apk add php7-gd php7-mysqli php7-zlib php7-curl;\
RUN apk update ;\
apk add nginx ;\
apk add openssl; \
apk add php7 php7-fpm php7-opcache ;\
apk add php7-openssl php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib;\
apk add mysql-client;\
apk add wget; \
mkdir -p /usr/share/nginx/html ;\
echo "hello world" > /usr/share/nginx/html/index.html ;\
mkdir -p /run/nginx ;

COPY default.conf /etc/nginx/conf.d/

COPY setup.sh .
COPY wp-config.php .
COPY start.sh .
RUN sh setup.sh
EXPOSE 80
EXPOSE 443
CMD ["sh", "start.sh"]
