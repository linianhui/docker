FROM microsoft/dotnet:2.1-sdk-alpine

# net core 2.1  https://hub.docker.com/r/microsoft/dotnet/
# cake 0.30.0   https://www.nuget.org/packages/Cake.Tool/

ENV PATH="$PATH:/root/.dotnet/tools"

RUN dotnet tool install --global Cake.Tool --version 0.30.0
