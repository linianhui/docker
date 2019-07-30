# 部署traefik ingress

```sh
# traefik pod
kubectl apply -f traefik.ingress.daemon-set.yml

# traefik web admin dashboard service
kubectl apply -f traefik.admin.service.yml

# traefik web admin dashboard ingress
kubectl apply -f traefik.admin.ingress.yml
```

web admin dashboard : http://192.168.2.235/.admin

# 部署echo服务 

```sh
# echo deployment
kubectl apply -f echo/echo.deployment.yml

# echo service
kubectl apply -f echo/echo.service.yml

# echo ingress
kubectl apply -f echo/echo.ingress.yml

# scale echo
kubectl scale deployment echo-deployment --replicas 5
```

http api : http://192.168.2.235