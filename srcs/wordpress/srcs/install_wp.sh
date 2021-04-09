mysqladmin -u wp_user -h 10.96.83.102 --password='1234' status;
while [ $? != 0 ]
do
	sleep 5;
	mysqladmin -u wp_user -h 10.96.83.102 --password='1234' status;
done
	

if ! ( wp-cli core is-installed --path=/usr/share/nginx/html/wordpress )
then
wp-cli core install --url=https://192.168.99.110:5050 --title=Magie --admin_user=root --admin_password=1234 --admin_email=corentinfrancois31@gmail.com --path=/usr/share/nginx/html/wordpress
wp-cli option update comment_whitelist 0 --path=/usr/share/nginx/html/wordpress
wp-cli option update comments_notify 0 --path=/usr/share/nginx/html/wordpress
wp-cli user create bob bob@example.com --user_pass=123 --role=author --path=/usr/share/nginx/html/wordpress
wp-cli user create bill bill@example.com --user_pass=123 --path=/usr/share/nginx/html/wordpress
fi
