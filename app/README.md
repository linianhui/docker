
# hosts

Update local `/etc/hosts`.

```bash
cat <<EOF >> /etc/hosts
127.0.0.1 traefik.test
127.0.0.1 zipkin.test
127.0.0.1 registry.test
127.0.0.1 portainer.test
127.0.0.1 jenkins.test
127.0.0.1 gogs.test
127.0.0.1 gitea.test
127.0.0.1 echo.test
EOF
```