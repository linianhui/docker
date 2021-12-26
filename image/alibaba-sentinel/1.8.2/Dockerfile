FROM ghcr.io/linianhui/openjdk:8u302

WORKDIR /app

ENV SENTINEL_VERSION=1.8.2
ENV SENTINEL_DOWNLOAD_URL=https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar

RUN wget -q -O /app/sentinel-dashboard.jar $SENTINEL_DOWNLOAD_URL

ENV JAVA_OPTIONS='-XX:+UseG1GC -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.00'
ENV APP_OPTIONS='-Dserver.port=80 -Dcsp.sentinel.dashboard.server=localhost:80 -Dproject.name=sentinel-dashboard'

ENTRYPOINT ["/bin/bash", "-c", "java $JAVA_OPTIONS $APP_OPTIONS -jar sentinel-dashboard.jar"]

EXPOSE 80
