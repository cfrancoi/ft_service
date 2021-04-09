#install db
#/usr/bin/mysql_install_db --datadir="/var/lib/mysql" --user=mysql
#start
influxd -config ./influx.conf &


influx << EOF
CREATE DATABASES telegraf_metrics;
EOF

telegraf --config="./config.conf"
