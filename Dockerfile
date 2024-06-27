FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /home/ps
COPY ./audio.ps1 /home/ps
COPY ./video.ps1 /home/ps
COPY ./playlist.ps1 /home/ps
RUN chmod -R 777 /home/ps
WORKDIR /tmp
#https://github.com/yt-dlp/FFmpeg-Builds/releases
COPY ../ffmpeg-n7.0-latest-linux64-gpl-7.0.tar.xz .
RUN apt-get update && apt-get install -y --no-install-recommends && apt-get install -y tzdata \
	&& apt-get install -y wget \
	&& apt-get install -y python3 \
	&& apt-get install -y tar \
	&& apt-get install -y unzip \
	&& apt-get install -y xz-utils \
	&& tar -xf 'ffmpeg-n7.0-latest-linux64-gpl-7.0.tar.xz' -C /tmp \
	&& wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
	&& apt-get -y install ./packages-microsoft-prod.deb \
	&& apt-get -y update \
	&& apt-get -y install powershell \
	&& mv $(find ffmpeg-n7.0-latest-linux64-gpl-7.0/bin -name ffmpeg) /usr/local/bin/ \
	&& mv $(find ffmpeg-n7.0-latest-linux64-gpl-7.0/bin -name ffprobe) /usr/local/bin/ \
	&& mv $(find ffmpeg-n7.0-latest-linux64-gpl-7.0/bin -name ffplay) /usr/local/bin/ \
	&& rm -rf /tmp/* \
	&& wget -qO /usr/local/bin/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
	&& chmod a+x /opt/microsoft/powershell/7/pwsh \
	&& chmod -R a+x /usr/local/bin/ \
	&& apt-get remove -y wget \
	&& apt-get remove -y unzip \
	&& apt-get remove -y xz-utils \
	&& apt-get -y autoclean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*
WORKDIR /home/output/ 
CMD ["yt-dlp", "--version"]
