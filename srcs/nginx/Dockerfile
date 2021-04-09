FROM alpine:3.12

RUN apk update ;\
apk add nginx ;\
apk add openssl; \
mkdir -p /usr/share/nginx/html ;\
echo "hello world" > /usr/share/nginx/html/index.html ;\
mkdir -p /run/nginx ;

COPY ./srcs/default.conf /etc/nginx/conf.d/

COPY ./srcs/setup.sh .
RUN sh setup.sh
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
