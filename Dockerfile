# BitTorrent Sync
# VERSION 0.2

FROM frolvlad/alpine-python2

MAINTAINER leession <leession@gmail.com>

# Download and extract the executable to /usr/bin
ADD http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /usr/bin/btsync.tar.gz
RUN apk update && apk add --no-cache tzdata bash git wget \
	&& cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /tmp/* /var/cache/apk/* /root/.cache/* /root/.pip/*

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
