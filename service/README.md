# qbit service

This is not for the action itself, but to run qbittorrent as a service container instead. 

This is useful when we want a torrent client running through the various steps, for instance in order to seed a file.

## Kiryuu considerations

If we start qbit as a service, it would spawn before we have built and run kiryuu. Thus, we must make sure we only add the torrent (to seed) _after_ kiryuu is running, to make sure the announce goes through.

The Dockerfile is similar to the existing image, but we know the home path so we can build around it.
