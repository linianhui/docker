# run

## create traefik network

```bash
docker network create --driver bridge traefik-network
```

## deploy app

```bash
docker-compose --file traefik.yml up --detach
docker-compose --file portainer.yml up --detach
docker-compose --file docker-api.yml up --detach
```

# hosts

Update local `/etc/hosts`.

```bash
cat <<EOF >> /etc/hosts
127.0.0.1 traefik.lan
127.0.0.1 zipkin.lan
127.0.0.1 registry.lan
127.0.0.1 portainer.lan
127.0.0.1 jenkins.lan
127.0.0.1 gitea.lan
127.0.0.1 echo.lan
127.0.0.1 netdata.lan
127.0.0.1 cadvisor.lan
127.0.0.1 drone.lan
127.0.0.1 mysql.lan
127.0.0.1 admin.mysql.lan
127.0.0.1 redis.lan
127.0.0.1 admin.redis.lan
127.0.0.1 mongo.lan
127.0.0.1 admin.mongo.lan
EOF
```
