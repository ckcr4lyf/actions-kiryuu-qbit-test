FROM alpine

# install tcpdump
RUN apk update && apk upgrade && apk add tcpdump

# Get static qbittorrent, make it executable
RUN wget -O qnox https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.5.0_v2.0.8/x86_64-qbittorrent-nox
RUN chmod +x /qnox

COPY entrypoint.sh /

# Copy config files to root
# (Github action will override the $HOME dir, so we will copy the config files at runtime via entrypoint.sh)
# This is because qbittorrent expects the config files to be relative to $HOME
COPY qBittorrent.conf /
COPY watched_folders.json /

RUN mkdir -p /watch


ENTRYPOINT ["/entrypoint.sh"]
