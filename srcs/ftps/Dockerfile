FROM alpine:3.12

RUN apk update ;\
apk add vsftpd;\
apk add openssl;\
mkdir /var/ftp/;

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/vsftpd.userlist /etc/vsftpd/
COPY ./srcs/start.sh .
EXPOSE 21
EXPOSE 20
Expose 30020
Expose 30021

CMD ["sh", "start.sh"]
