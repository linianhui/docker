# https://hub.docker.com/r/drone/drone
# https://hub.docker.com/r/drone/drone/~/dockerfile

FROM drone/drone

# http://docs.drone.io/installation/
# http://docs.drone.io/user-registration/
# http://docs.drone.io/user-admins/
ENV DRONE_OPEN=true \
    DRONE_ADMIN=root \
    DRONE_SECRET=1234

# http://docs.drone.io/install-for-gogs/
ENV DRONE_GOGS=true \
    DRONE_GOGS_GIT_USERNAME=root \
    DRONE_GOGS_GIT_PASSWORD=1234 \
    DRONE_GOGS_SKIP_VERIFY=true

# http://docs.drone.io/install-for-gitea/
ENV DRONE_GITEA=true \
    DRONE_GITEA_GIT_USERNAME=root \
    DRONE_GITEA_GIT_PASSWORD=1234 \
    DRONE_GITEA_SKIP_VERIFY=true

# http://docs.drone.io/install-for-gitlab/
ENV DRONE_GITLAB=false \
    DRONE_GITLAB_GIT_USERNAME=root \
    DRONE_GITLAB_GIT_PASSWORD=12345678 \
    DRONE_GITLAB_SKIP_VERIFY=true

EXPOSE 8000 9000
