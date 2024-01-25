if (-not (docker ps -q --filter "name=yt-dlp")) {
    if (Test-Path /home/output/audio.txt) {
        docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/audio.ps1
}
}

if (-not (docker ps -q --filter "name=yt-dlp")) {
    if (Test-Path /home/output/video.txt) {
		docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/video.ps1
}
}

if (-not (docker ps -q --filter "name=yt-dlp")) {
    if (Test-Path /home/output/playlist.txt) {
		docker run -d --rm -m 1024m --name yt-dlp -e TZ=Europe/Berlin -v /volume1/docker/yt-dlp/:/home/output yt-dlp pwsh /home/ps/playlist.ps1
}
}
