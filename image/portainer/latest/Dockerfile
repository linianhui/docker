# https://github.com/portainer/portainer
# https://hub.docker.com/r/portainer/portainer
FROM portainer/portainer

# https://docs.docker.com/engine/reference/builder/#label
LABEL MAINTAINER="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/portainer/latest"

# https://portainer.readthedocs.io/en/stable/configuration.html 
ENTRYPOINT ["/portainer", "--bind=:80", "--no-auth"]

EXPOSE 80