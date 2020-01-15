#!/bin/bash
set -xe

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y --no-install-recommends \
    sudo \
    gnupg2 \
    curl \
    ca-certificates

curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1810/x86_64/7fa2af80.pub | apt-key add -
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1810/x86_64 /" > /etc/apt/sources.list.d/cuda.list
echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

apt-get update -y

# NVIDIA Drivers & CUDA
apt-get install -y --no-install-recommends \
    cuda-cudart-10-1=10.1.168-1 \
    cuda-compat-10-1 \
    cuda-libraries-10-1=10.1.168-1 \
    cuda-nvtx-10-1=10.1.168-1 \
    libcublas10=10.2.0.168-1 \
    libnccl2=2.5.6-1+cuda10.2 \
    cuda-nvml-dev-10-1=10.1.168-1 \
    cuda-command-line-tools-10-1=10.1.168-1 \
    cuda-libraries-dev-10-1=10.1.168-1 \
    cuda-minimal-build-10-1=10.1.168-1 \
    libnccl-dev=2.5.6-1+cuda10.2 \
    libcublas-dev=10.2.0.168-1 \
    libcudnn7=7.6.5.32-1+cuda10.1 \
    libcudnn7-dev=7.6.5.32-1+cuda10.1

#ENV CUDNN_VERSION 7.6.5.32
#LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
#ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs

apt-mark hold libnccl2
apt-mark hold libcudnn7 
ln -s cuda-10.1 /usr/local/cuda && \

# NVIDIA OpenGL
dpkg --add-architecture i386
apt-get update -y
apt-get install -y --no-install-recommends \
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
apt-get install -y --no-install-recommends \
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
apt-get install -y --no-install-recommends \
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
apt-get update -y
apt-get install -y --no-install-recommends libjasper-dev

# MKL
# https://software.intel.com/en-us/articles/installing-intel-free-libs-and-python-apt-repo
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
wget https://apt.repos.intel.com/setup/intelproducts.list -O /etc/apt/sources.list.d/intelproducts.list
apt-get update -y
apt-get install -y --no-install-recommends \
    intel-mkl-2019.4-070 \
    intel-ipp-2019.4-070 \
    intel-tbb-2019.6-070 \
    intel-daal-2019.4-070 \
    intel-mpi-2019.4-070

# https://askubuntu.com/questions/508503/whats-the-development-package-for-qt5-in-14-04
apt-get install -y --no-install-recommends \
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

apt-get autoremove -y
rm -f GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
rm -rf /var/lib/apt/lists/*
