FROM openjdk:13-alpine

ENV FILEBOT_VERSION 4.8.5
ENV FILEBOT_URL https://github.com/barry-allen07/FB-Mod/releases/download/$FILEBOT_VERSION/FileBot_$FILEBOT_VERSION-Linux-Portable.tar.xz

ENV FILEBOT_HOME /opt/filebot

RUN apk --no-cache add --update p7zip unrar

RUN set -eux \
 && wget -O /filebot.tar.xz "$FILEBOT_URL" \
 && mkdir -p "$FILEBOT_HOME" \
 && tar --extract --file /filebot.tar.xz --directory "$FILEBOT_HOME" --verbose \
 && rm /filebot.tar.xz

VOLUME /data
VOLUME /volume1

ENV HOME /data
ENV LANG C.UTF-8
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Dnet.filebot.archive.extractor=ShellExecutables -Duser.home=$HOME"

WORKDIR /volume1

ENTRYPOINT ["/opt/filebot/filebot.sh"]
