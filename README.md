# filebot-docker
Docker image for FileBot.

## filebot

The [`filebot`](https://www.filebot.net/cli.html) command-line tool.

```
docker run --rm -it -v $PWD:/volume1 -v data:/data c64bobdocker/filebot-docker -script fn:sysinfo
```
