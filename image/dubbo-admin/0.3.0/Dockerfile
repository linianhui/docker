FROM maven:3.8-openjdk-8 as builder

WORKDIR /src

RUN git clone https://github.com/apache/dubbo-admin.git && git checkout 0.3.0

COPY application.properties /src/dubbo-admin-distribution/src/bin/config/

RUN mvn clean package -Dmaven.test.skip=true

FROM ghcr.io/linianhui/openjdk:8u302

WORKDIR /dubbo-admin

ENV DUBBO_ADMIN_VERSION=0.3.0

COPY --from=builder /src/dubbo-admin-distribution/target/dubbo-admin-0.3.0.jar app.jar

ENTRYPOINT ["/bin/bash", "-c", "java $JAVA_OPTIONS $JAVA_DEBUG_OPTIONS -jar app.jar"]

EXPOSE 8080
