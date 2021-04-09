
adduser -D -g "admin" admin
echo "admin:pass1234" | chpasswd
mkdir /home/admin/ftp
chown admin:admin /home/admin
chown admin:admin /home/admin/ftp

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj '/C=FR/ST=FR/L=null/O=null/CN=null' \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

vsftpd /etc/vsftpd/vsftpd.conf
