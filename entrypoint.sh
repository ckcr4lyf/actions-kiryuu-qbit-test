#!/bin/sh

mkdir -p ~/.config/qBittorrent

cp /qBittorrent.conf ~/.config/qBittorrent/qBittorrent.conf
cp /watched_folders.json ~/.config/qBittorrent/watched_folders.json

echo "starting tcpdumps"
tcpdump -nnSX port 6969 &>tcpdump.log &
tcpdump -w tcpdump.pcap &

echo "sleeping for 2 seconds"
sleep 2

cp "$INPUT_TORRENT_NAME" /watch

echo "starting qbittorrent"

/qnox &

FILE="/downloads/$INPUT_FILE_NAME"

for i in {1..60}
do
    echo "Checking if file $FILE exists..."
    if [[ -f "$FILE" ]]; then
        # Technically qbit may have made it but not finish downloading...
        # Better we add directive to move downloaded file to diff directory, or add extension...
        echo "Found file $FILE"
        break
    fi
    echo "File $FILE not found. Sleeping for 1 second..."
    sleep 1
done

cat ~/.local/share/qBittorrent/logs/qbittorrent.log

# The path would be something like /downloads/hello.txt
SHA="$(sha256sum /downloads/$INPUT_FILE_NAME | awk '{print $1}')"
echo "SHA=$SHA" >> $GITHUB_OUTPUT
