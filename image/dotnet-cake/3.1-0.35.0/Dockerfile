# https://hub.docker.com/_/microsoft-dotnet-core/
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

# https://docs.docker.com/engine/reference/builder/#label
LABEL maintainer="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/dotnet-cake/3.1-0.35.0"

ENV PATH="$PATH:/root/.dotnet/tools"

# https://www.nuget.org/packages/cake.tool
RUN dotnet tool install --global Cake.Tool --version 0.35.0
