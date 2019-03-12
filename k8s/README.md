# 部署traefik ingress

```sh
# traefik pod
kubectl create -f traefik.ingress.daemon-set.yml

# traefik web admin dashboard service
kubectl create -f traefik.admin.service.yml

# traefik web admin dashboard ingress
kubectl create -f traefik.admin.ingress.yml
```

web admin dashboard : http://192.168.2.235/.admin

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

http api : http://192.168.2.235