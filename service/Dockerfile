FROM alpine

# Get static qbittorrent, make it executable
RUN wget -O qnox https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.5.0_v2.0.8/x86_64-qbittorrent-nox
RUN chmod +x /qnox

RUN mkdir -p /root/.config/qBittorrent

# Download to /downloads
COPY qBittorrent.conf /root/.config/qBittorrent/
RUN mkdir /downloads
RUN chmod -R 777 /downloads

# Watch /watch
COPY watched_folders.json /root/.config/qBittorrent/
RUN mkdir /watch
RUN chmod -R 777 /watch

CMD ["/qnox"]
