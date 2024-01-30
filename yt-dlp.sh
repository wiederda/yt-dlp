#!/bin/bash

if [ ! "$(docker ps -q --filter "name=wiederda/yt-dlp")" ]; then
    if [ -e /volume1/docker/audio.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/audio.ps1
    fi

    if [ -e /volume1/docker/video.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/video.ps1
    fi

    if [ -e /volume1/docker/playlist.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/playlist.ps1
    fi
fi
