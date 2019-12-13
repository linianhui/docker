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
127.0.0.1 traefik.test
127.0.0.1 zipkin.test
127.0.0.1 registry.test
127.0.0.1 portainer.test
127.0.0.1 jenkins.test
127.0.0.1 gitea.test
127.0.0.1 echo.test
127.0.0.1 netdata.test
127.0.0.1 cadvisor.test
127.0.0.1 drone.test
EOF
```