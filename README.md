# ft_service

# link
-https://stackoverflow.com/questions/63559779/kubernetes-minikube-persistent-volume-local-filesystem-storage-location

-https://minikube.sigs.k8s.io/docs/handbook/persistent_volumes/

-https://minikube.sigs.k8s.io/docs/handbook/mount/



location /phpmyadmin/ {
            proxy_pass http://192.168.99.124:5000/;
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-Proto https;
            proxy_set_header X-Forwarded-Host $server_name;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

pmaaboluteuri = './'
