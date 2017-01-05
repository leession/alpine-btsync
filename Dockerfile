# BitTorrent Sync
# VERSION 2.0

FROM frolvlad/alpine-glibc
MAINTAINER leession <leession@gmail.com>

# Download and extract the executable to /usr/bin
ADD https://download-cdn.resilio.com/stable/linux-glibc-i386/resilio-sync_glibc23_i386.tar.gz /bin/btsync.tar.gz
RUN apk update && apk add --no-cache tzdata bash \
	&& cd /bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /tmp/* /var/cache/apk/* /root/.cache/* /root/.pip/*

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
