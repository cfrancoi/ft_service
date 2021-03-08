openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj '/C=FR/ST=FR/L=null/O=null/CN=null' \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
mkdir phpMyAdmin
tar -xzvf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin
mv phpMyAdmin/phpMyAdmin-5.1.0-all-languages /usr/share/nginx/html/phpMyAdmin
mv config.inc.php /usr/share/nginx/html/phpMyAdmin
chown -R nginx:nginx /usr/share/nginx/html
chmod 755 /usr/share/nginx/html
