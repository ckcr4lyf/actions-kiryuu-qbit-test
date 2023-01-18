# actions-kiryuu-qbit-test

A custom action which runs an instance of qbittorrent , set to add a hardcoded torrent. The goal is to be able to test [kiryuu](https://github.com/ckcr4lyf/kiryuu) in Github Actions.

I doubt this action would be of much use to anyone else, but maybe it can be a base to implement similar tests for your own software.

## Tagging

Make a tag:

```
git tag -a -m "My first action release" v1
```

Update latest tag:

```
git tag -f latest [commit]
```