#!/bin/bash
set -xe

apt update -y

export DEBIAN_FRONTEND=noninteractive

# NVIDIA OpenGL
dpkg --add-architecture i386
apt update -y
apt install -y --no-install-recommends \
    libxau6 libxau6:i386 \
    libxdmcp6 libxdmcp6:i386 \
    libxcb1 libxcb1:i386 \
    libxext6 libxext6:i386 \
    libx11-6 libx11-6:i386  \
    libglvnd0 libglvnd0:i386 \
    libgl1 libgl1:i386 \
    libglx0 libglx0:i386 \
    libegl1 libegl1:i386 \
    libgles2 libgles2:i386 \
    pkg-config \
    libglvnd-dev libglvnd-dev:i386 \
    libgl1-mesa-dev libgl1-mesa-dev:i386 \
    libegl1-mesa-dev libegl1-mesa-dev:i386 \
    libgles2-mesa-dev libgles2-mesa-dev:i386 \
    mesa-utils

# Common Development
apt install -y \
    software-properties-common \
    apt-transport-https \
    build-essential \
    g++ \
    yasm \
    checkinstall \
    pkg-config \
    gfortran \
    dkms \
    git \
    git-lfs \
    wget \
    curl \
    parallel \
    nano \
    libfreeimage-dev \
    libsdl2-dev \
    libfreetype6-dev \
    libjemalloc-dev

# Video, VLC, ffmpeg, OpenCV 
apt install -y \
    freeglut3 \
    freeglut3-dev \
    libxi-dev \
    libxmu-dev \
    python-opencv \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgtk2.0-dev \
    libzip-dev \
    libbz2-dev \
    "^libxcb.*" \
    libglu1-mesa-dev \
    software-properties-common \
    vlc \
    libvlc-dev \
    libvlccore-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavformat-dev \
    libavutil-dev \
    python-dev \
    python-numpy \
    python3-dev \
    python3-numpy \
    libjpeg-dev \
    libtiff-dev \
    libatlas-base-dev \
    libpq-dev \
    swig \
    libpulse-mainloop-glib0

echo "deb http://security.ubuntu.com/ubuntu xenial-security main" | tee -a /etc/apt/sources.list
apt update -y
apt install -y libjasper-dev

# MKL
# https://software.intel.com/en-us/articles/installing-intel-free-libs-and-python-apt-repo
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
wget https://apt.repos.intel.com/setup/intelproducts.list -O /etc/apt/sources.list.d/intelproducts.list
apt-get update
apt install -y \
    intel-mkl-2019.4-070 \
    intel-ipp-2019.4-070 \
    intel-tbb-2019.6-070 \
    intel-daal-2019.4-070 \
    intel-mpi-2019.4-070

# https://askubuntu.com/questions/508503/whats-the-development-package-for-qt5-in-14-04
apt install -y \
    gedit \
    qtcreator \
    qt5-default \
    qt5-doc \
    qtbase5-examples \
    qtbase5-doc-html \
    qtdeclarative5-dev \
    qtmultimedia5-dev \
    libqt5svg5-dev \
    qtpositioning5-dev \
    qttools5-dev \
    qtbase5-dev \
    qml-module-qtquick-controls2 \
    qtquickcontrols2-5-dev \
    libqt5location5-plugins \
    qml-module-qtlocation \
    qtlocation5-dev

apt autoremove -y
rm -f GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
rm -rf /var/lib/apt/lists/*
