# 部署ingress

```sh
# traefik pod
kubectl create -f ingress.daemon-set.yml

# traefik web ui service
kubectl create -f ingress.service.yml

# traefik web ui ingress
kubectl create -f ingress.yml
```

web ui : http://192.168.2.225/.admin

# 部署api服务 

```sh
# api deployment
kubectl create -f api/api.deployment.yml

# api service
kubectl create -f api/api.service.yml

# api ingress
kubectl create -f api/api.ingress.yml

# scale api
kubectl scale deployment api-deployment --replicas 5
```

http api : http://192.168.2.225