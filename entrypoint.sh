#!/bin/sh

mkdir -p ~/.config/qBittorrent

cp /qBittorrent.conf ~/.config/qBittorrent/qBittorrent.conf
cp /watched_folders.json ~/.config/qBittorrent/watched_folders.json

echo "starting tcpdump"
tcpdump -nnSX port 6969 &>tcpdump.log &

echo "sleeping for 2 seconds"
sleep 2

cp "$INPUT_TORRENT_NAME" /watch

echo "starting qbittorrent"

/qnox &

# Sleep for some time to let qbittorrent start, pick up torrent from watch dir
echo "sleeping for 60 seconds"
sleep 60

cat ~/.config/qBittorrent/qBittorrent.conf
cat ~/.local/share/qBittorrent/logs/qbittorrent.log

echo "ls /downloads"
ls -la /downloads

echo "ls ~/Downloads"
ls -la ~/Downloads

# The path would be something like /downloads/hello.txt
SHA="$(sha256sum /downloads/$INPUT_FILE_NAME)"
echo "SHA=$SHA" >> $GITHUB_OUTPUT
