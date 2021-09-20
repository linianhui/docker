FROM maven:3.8-openjdk-8 as builder

RUN git clone -b 0.3.0 --depth=1 https://github.com/apache/dubbo-admin.git src

COPY application.properties /src/dubbo-admin-server/src/main/resources/

RUN cd src && mvn clean package -q -Dmaven.test.skip=true

FROM ghcr.io/linianhui/openjdk:8u302

WORKDIR /dubbo-admin

ENV DUBBO_ADMIN_VERSION=0.3.0

COPY --from=builder /src/dubbo-admin-distribution/target/dubbo-admin-0.3.0.jar app.jar

ENTRYPOINT ["/bin/bash", "-c", "java $JAVA_OPTIONS -jar app.jar"]

EXPOSE 8080
