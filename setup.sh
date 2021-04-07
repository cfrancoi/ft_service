#!/bin/bash

export MINIKUBE_HOME=/media/francois/Ub-data/minikube
minikube start --driver=virtualbox --cpus 2 --memory 4000mb --disk-size 7500mb --extra-config=apiserver.service-node-port-range=1-35000 --docker-env DOCKER_TLS_VERIFY=0
eval $(minikube docker-env)
export MINIKUBE_IP=$(minikube ip)

#--metallb--
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

sed  "s/IP/$MINIKUBE_IP/g" srcs/metallb-sample.yaml > srcs/metallb-conf.yaml
kubectl create -f srcs/metallb-conf.yaml

#--ftps--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/ftps/vsftpd.sample > srcs/ftps/vsftpd.conf
docker build srcs/ftps -t ft_ftps
kubectl apply -f srcs/ftps.yaml
#--Nginx--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/nginx/site-sample.conf > srcs/nginx/default.conf
docker build srcs/nginx/ -t ft_nginx
kubectl apply -f srcs/nginx.yaml

#--Mysql-server--
#kubectl apply -f srcs/mysql-vol.yaml
docker build srcs/mysql/ -t ft_mysql
kubectl apply -f srcs/mysql.yaml

#--PhpMyAdmin--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/phpMyAdmin/site-sample.conf > srcs/phpMyAdmin/default.conf
docker build srcs/phpMyAdmin/ -t ft_phpmyadmin
kubectl apply -f srcs/phpMyAdmin.yaml

#--InfluxDB--
kubectl create configmap cert-conf --from-file=$DOCKER_CERT_PATH
sed "s=_IP_=$DOCKER_HOST=g" srcs/influxdb/sample.conf > srcs/influxdb/config.conf
docker build srcs/influxdb/ -t ft_influxdb
cp -r $DOCKER_CERT_PATH /Users/cfrancoi/vol/influx-vol
#kubectl apply -f srcs/influx-vol.yaml # add volume
kubectl apply -f srcs/influxdb.yaml

#--Wordpress--
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/site-sample.conf > srcs/wordpress/default.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/start-sample > srcs/wordpress/start.sh
docker build srcs/wordpress/ -t ft_wordpress
kubectl apply -f srcs/wordpress.yaml

#--grafana--
docker build srcs/grafana/ -t ft_grafana
kubectl apply -f srcs/grafana.yaml


minikube dashboard
