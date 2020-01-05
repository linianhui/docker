# 部署dashboard

```sh
# 部署dashboard
kubectl apply -f dashboard.yml

# 查看token
kubectl -n kube-dashboard get secret | grep kube-dashboard-admin-token-
kubectl -n kube-dashboard describe secret kube-dashboard-admin-token-xxxx

# 强制删除 kube-dashboard namespace
kubectl delete namespace kube-dashboard --force --grace-period=0
```

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


# Debug

```sh
# --image-pull-policy=Always
kubectl run tool --namespace default --image=lnhcode/tool --generator=run-pod/v1 --restart=Never --stdin --tty --rm --command -- nslookup github.com
```