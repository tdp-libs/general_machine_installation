FROM alpine:3.13

RUN addgroup -g 1000 tom
RUN adduser -u 1000 -S tom -G tom
RUN install -d -m 0755 -o tom -g tom /home/tom

VOLUME ["/home/tom/projects","/home/tom/.config","/home/tom/.ssh"]

RUN apk add --update --no-cache \
    make \
    cmake \
    g++ \
    git \
    freeimage \
    freeimage-dev \
    libx11-dev \
    xorg-server-dev \
    mesa-dev \
    freeglut-dev \
    glew-dev \
    mesa-gl \
    mesa \
    boost-dev \
    openssl-dev \
    xvfb \
    xf86-video-dummy \
    bash

WORKDIR /home/tom/
USER tom

