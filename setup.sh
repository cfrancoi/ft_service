#!/bin/bash

export MINIKUBE_HOME=~/goinfre
minikube start --driver=virtualbox --cpus 2 --memory 4000mb --disk-size 7500mb --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)
export MINIKUBE_IP=$(minikube ip)

#--metallb--
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

sed  "s/IP/$MINIKUBE_IP/g" srcs/metallb/metallb-sample.yaml > srcs/metallb/metallb-conf.yaml
kubectl create -f srcs/metallb/metallb-conf.yaml

#--ftps--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/ftps/srcs/vsftpd.sample > srcs/ftps/srcs/vsftpd.conf
docker build srcs/ftps -t ft_ftps
kubectl apply -f srcs/ftps/ftps.yaml
#--Nginx--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/nginx/srcs/site-sample.conf > srcs/nginx/srcs/default.conf
docker build srcs/nginx/ -t ft_nginx
kubectl apply -f srcs/nginx/nginx.yaml

#--Mysql-server--
docker build srcs/mysql/ -t ft_mysql
kubectl apply -f srcs/mysql/mysql.yaml

#--PhpMyAdmin--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/phpMyAdmin/srcs/site-sample.conf > srcs/phpMyAdmin/srcs/default.conf
docker build srcs/phpMyAdmin/ -t ft_phpmyadmin
kubectl apply -f srcs/phpMyAdmin/phpMyAdmin.yaml

#--InfluxDB--
kubectl create configmap cert-conf --from-file=$DOCKER_CERT_PATH
sed "s=_IP_=$DOCKER_HOST=g" srcs/influxdb/srcs/sample.conf > srcs/influxdb/srcs/config.conf
docker build srcs/influxdb/ -t ft_influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

#--Wordpress--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/srcs/site-sample.conf > srcs/wordpress/srcs/default.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/srcs/install_db > srcs/wordpress/srcs/install_db.sh
docker build srcs/wordpress/ -t ft_wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

#--grafana--
docker build srcs/grafana/ -t ft_grafana
kubectl apply -f srcs/grafana/grafana.yaml


minikube dashboard
