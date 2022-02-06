# https://hub.docker.com/_/maven
FROM maven:3.8-openjdk-11

VOLUME [ "/repo" ]

ADD https://linianhui.github.io/docker/file/debian-bullseye-sources.list /etc/apt/sources.list

ADD https://linianhui.github.io/docker/file/maven-settings.xml /root/.m2/settings.xml
