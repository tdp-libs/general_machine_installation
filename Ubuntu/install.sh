#!/bin/bash
set -xe

apt update -y
apt upgrade -y

# Less stupid window managers
apt install -y xubuntu-desktop xorg xubuntu-core
apt install -y kubuntu-desktop

# Common Development
apt install -y \
    software-properties-common \
    apt-transport-https \
    xubuntu-desktop \
    build-essential \
    g++ \
    yasm \
    checkinstall \
    pkg-config \
    gfortran \
    dkms \
    git \
    git-lfs \
    git-cola \
    cmake \
    meld \
    wget \
    curl \
    parallel

# Graphics
apt install -y \
    kolourpaint4 \
    inkscape

# VS Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update -y
apt install -y code

apt upgrade -y
apt autoremove -y


