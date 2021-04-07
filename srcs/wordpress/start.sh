/usr/sbin/php-fpm7
mv wp-config.php usr/share/nginx/html/wordpress/
mysql -u wp_user --password="1234" --host="10.96.83.102" <<EOF
USE wp_db;
UPDATE wp_options SET option_value = 'https://192.168.99.108:5050' WHERE wp_options.option_id = 1;
UPDATE wp_options SET option_value = 'https://192.168.99.108:5050' WHERE wp_options.option_id = 2;
EOF
nginx -g 'daemon off;'
