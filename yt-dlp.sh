#!/bin/bash

if [ ! "$(docker ps -q --filter "name=yt-dlp")" ]; then
    if [ -e /home/output/audio.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/audio.ps1
    fi

    if [ -e /home/output/video.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/video.ps1
    fi

    if [ -e /home/output/playlist.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/playlist.ps1
    fi
fi
