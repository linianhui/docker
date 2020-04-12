# https://hub.docker.com/_/openjdk
FROM openjdk:11.0.6

# https://stackoverflow.com/questions/39434493/bash-c-vs-dash-c
# https://stackoverflow.com/questions/52968361/different-process-are-running-as-pid-1-when-running-cmd-entrypoint-in-shell-form
RUN ln -sf /bin/bash /bin/sh

# https://docs.docker.com/engine/reference/builder/#label
LABEL MAINTAINER="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/openjdk/11.0.6"

COPY sources.list /etc/apt/sources.list
