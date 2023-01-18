#!/bin/sh

pwd

ifconfig

mkdir -p ~/.config/qBittorrent

cp /qBittorrent.conf ~/.config/qBittorrent/qBittorrent.conf
cp /watched_folders.json ~/.config/qBittorrent/watched_folders.json

ls ~/.config

echo "starting tcpdump"
tcpdump -nnSX port 6969 &>tcpdump.log &

echo "sleeping for 2 seconds"
sleep 2

echo "starting qbittorrent"

/qnox &

# Sleep for some time to let qbittorrent start, pick up torrent from watch dir
echo "sleeping for 60 seconds"
sleep 60
echo "finished sleep"
