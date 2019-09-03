#!/bin/bash
set -xe

apt update -y
apt upgrade -y

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

apt autoremove -y
rm -f GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
