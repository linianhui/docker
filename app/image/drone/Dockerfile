# https://hub.docker.com/r/drone/drone
# https://hub.docker.com/r/drone/drone/~/dockerfile

FROM drone/drone:1.6.3

# http://docs.drone.io
ENV DRONE_SERVER_PROTO=http \
    DRONE_SERVER_HOST=drone.test \
    DRONE_GIT_ALWAYS_AUTH=false \
    DRONE_RPC_SECRET=1234 


# https://docs.drone.io/installation/providers/gitea/
ENV DRONE_GITEA_SERVER=http://gitea.test \
    DRONE_GITEA_CLIENT_ID=e713eac4-fb12-4365-98a8-f4b40a0023f5 \
    DRONE_GITEA_CLIENT_SECRET=KsN2j3tfbGyhOMgTZcsGKNU5bspTx9gImoIrLuJG0XY=

EXPOSE 8000 9000
