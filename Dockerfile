FROM node:latest
LABEL maintainer "Volker Gaibler <volker.gaibler@h-its.org>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy update \
    && apt-get -qy dist-upgrade \
    && apt-get -qy install unzip

RUN mkdir /meshcommander \
    && cd /meshcommander \
    && wget -q "http://info.meshcentral.com/downloads/mdtk/meshcommandersource.zip" \
    && unzip meshcommandersource.zip \
    && cd MeshCommander/NodeJS \
    && npm install

EXPOSE 3000

WORKDIR /meshcommander/MeshCommander/NodeJS/
CMD ["node", "commander.js"]
