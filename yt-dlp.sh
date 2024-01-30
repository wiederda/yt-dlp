#!/bin/bash

<<<<<<< HEAD
if [ ! "$(docker ps -q --filter "name=wiederda/yt-dlp")" ]; then
    if [ -e /volume1/docker/audio.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/audio.ps1
    fi

    if [ -e /volume1/docker/video.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/video.ps1
    fi

    if [ -e /volume1/docker/playlist.txt ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output wiederda/yt-dlp pwsh /home/ps/playlist.ps1
=======
DOCKER_DIR="/volume1/docker/yt-dlp/"

if [ ! "$(docker ps -q -f name=wiederda/yt-dlp)" ]; then
    if [ -e "${DOCKER_DIR}audio.txt" ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v "${DOCKER_DIR}":/home/output wiederda/yt-dlp pwsh /home/ps/audio.ps1
    fi

    if [ -e "${DOCKER_DIR}video.txt" ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v "${DOCKER_DIR}":/home/output wiederda/yt-dlp pwsh /home/ps/video.ps1
    fi

    if [ -e "${DOCKER_DIR}playlist.txt" ]; then
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v "${DOCKER_DIR}":/home/output wiederda/yt-dlp pwsh /home/ps/playlist.ps1
>>>>>>> 27948730979affd793a36b602f1e00d5f8528c4b
    fi
fi