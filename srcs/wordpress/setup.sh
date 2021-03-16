openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj '/C=FR/ST=FR/L=null/O=null/CN=null' \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

mv wordpress/ /usr/share/nginx/html/
chown -R nginx:nginx /usr/share/nginx/html
chmod 755 /usr/share/nginx/html
