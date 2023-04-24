# 自用

```yaml
version: "3.5"
services:
  qbittorrent:
    image: qiyuey/qbittorrentee
    container_name: qbittorrentee
    environment:
      - PUID=1000
      - PGID=100
      - TZ=Asia/Shanghai
    volumes:
      - /share/Public/Docker/qbittorrentee:/config
      - /share/Archive/Downloads:/downloads
      - /share/Public/Data/Tech:/cert
    ports:
      - 6881:6881
      - 6881:6881/udp
      - 6363:6363
    restart: unless-stopped
```
