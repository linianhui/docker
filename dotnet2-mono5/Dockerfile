FROM microsoft/dotnet:2-sdk
# net core 2
# mono 5.4.1.6
# nuget

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/5.4.1.6 main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y --fix-missing mono-complete nuget \
  && rm -rf /var/lib/apt/lists/* /tmp/*
