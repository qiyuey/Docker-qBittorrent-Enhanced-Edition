FROM lsiobase/alpine:3.17-69ac1933-ls26 as builder
LABEL maintainer="qiyuey"

WORKDIR /qbittorrent

COPY install.sh /qbittorrent/
COPY ReleaseTag /qbittorrent/

RUN  apk add --no-cache ca-certificates curl

RUN cd /qbittorrent \
	&& chmod a+x install.sh \
	&& bash install.sh

# docker qBittorrent-Enhanced-Edition

FROM lsiobase/alpine:3.17-69ac1933-ls26

# environment settings
ENV TZ=Asia/Shanghai
ENV WEBUIPORT=6363

# add local files and install qbitorrent
COPY root /
COPY --from=builder  /qbittorrent/qbittorrent-nox   /usr/local/bin/qbittorrent-nox

# install python3
RUN  apk add --no-cache python3 \
&&   rm -rf /var/cache/apk/*   \
&&   chmod a+x  /usr/local/bin/qbittorrent-nox  

# ports and volumes
VOLUME /downloads /config /cert
EXPOSE 6363  6881  6881/udp
