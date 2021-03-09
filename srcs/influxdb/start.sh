#install db
#/usr/bin/mysql_install_db --datadir="/var/lib/mysql" --user=mysql
#start
influxd -config ./influx.conf & telegraf --config="./config.conf"
