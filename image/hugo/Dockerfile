FROM ubuntu

LABEL author="lnhcode@outlook.com"

ENV HUGO_VERSION=0.57.2

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb hugo.deb

RUN dpkg -i hugo.deb && rm hugo.deb

RUN apt-get update -y && apt-get install -y git