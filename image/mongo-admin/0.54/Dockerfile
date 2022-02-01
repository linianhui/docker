# https://hub.docker.com/_/mongo-express/
# https://github.com/mongo-express/mongo-express-docker/blob/master/Dockerfile
FROM mongo-express:0.54

ENV ME_CONFIG_BASICAUTH_USERNAME=root \
    ME_CONFIG_BASICAUTH_PASSWORD=1234 \
    ME_CONFIG_OPTIONS_EDITORTHEME=default \
    ME_CONFIG_MONGODB_SERVER=mongo.test \
    ME_CONFIG_MONGODB_PORT=27017 \
    ME_CONFIG_MONGODB_ENABLE_ADMIN=true \
    ME_CONFIG_MONGODB_ADMINUSERNAME=root \
    ME_CONFIG_MONGODB_ADMINPASSWORD=1234

EXPOSE 8081
