# https://hub.docker.com/r/gitea/gitea
FROM gitea/gitea:1.10.1

# https://docs.docker.com/engine/reference/builder/#label
LABEL maintainer="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/gitea/1.10.1"

# https://github.com/go-gitea/gitea/issues/8065#issuecomment-527656182
RUN apk --no-cache add libcap \
    && echo "setcap 'cap_net_bind_service=+ep' /app/gitea/gitea" >> /etc/s6/gitea/setup

# https://github.com/go-gitea/gitea/blob/master/docker/root/etc/s6/gitea/setup
# https://github.com/go-gitea/gitea/blob/master/docker/root/etc/templates/app.ini
# https://github.com/go-gitea/gitea/blob/master/custom/conf/app.ini.sample
ENV SSH_PORT=22 \
    HTTP_PORT=80 \
    APP_NAME=Gitea \
    RUN_MODE=prod \
    DB_TYPE=sqlite3 \
    ROOT_URL=http://gitea.test

EXPOSE 22 80
