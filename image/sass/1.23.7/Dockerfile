# https://hub.docker.com/_/node
FROM node:10-alpine

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/sass/1.23.7"

# https://www.npmjs.com/package/sass
ENV SASS_VERSION=1.23.7

RUN npm install --global sass@${SASS_VERSION}
