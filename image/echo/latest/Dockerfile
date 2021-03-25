# https://hub.docker.com/_/node
FROM node:10-alpine

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/echo/latest"

COPY app.js /

EXPOSE 80

ENTRYPOINT ["node", "app.js"]
