# https://github.com/google/cadvisor
# https://hub.docker.com/r/google/cadvisor
FROM google/cadvisor

# https://docs.docker.com/engine/reference/builder/#label
LABEL MAINTAINER="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/cadvisor/latest"

# https://github.com/google/cadvisor/blob/master/docs/runtime_options.md
ENTRYPOINT ["/usr/bin/cadvisor", "--logtostderr=true", "--port=80"]

EXPOSE 80