FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:jonathonf/ffmpeg-4 && \
    apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get install -y nginx && \
    apt-get install -y htop

RUN mkdir -p /stream/

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 && \
    apt-get install -y python3-pip && \
    pip3 install flask && \
    pip3 install gunicorn

RUN apt-get install -y vim

RUN mkdir -p /return/
RUN mkdir -p /work/

WORKDIR /work/

COPY . . 

#jRUN ( ffmpeg -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov /return/bunny_%05d.jpg & )

# gunicorn --bind 0.0.0.0:5000 wsgi:app

