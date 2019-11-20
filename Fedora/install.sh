#!/bin/bash

#An installation script for install the tools common to a Development Machine

set -xe

if id "$1" >/dev/null 2>&1; then
  echo "Installing for user: $1"
else
  echo "User does not exist."
  echo "Usage: ./install.sh user_name"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

dnf -y update

dnf install -y firefox evince gedit nano ghex pwgen ark parallel

dnf groupinstall -y "Development Tools"
dnf install -y gcc-c++ meld git svn mercurial wget screen cmake git-cola git-lfs
dnf install -y SDL2 SDL2-devel
dnf install -y ncurses-devel zlib-devel openssl openssl-devel mesa-libGL mesa-libGL-devel texlive-latex texlive-latex-bin boost-devel freeimage freeimage-devel glm-devel
dnf install -y "perl(Data::Dumper)" "perl(Thread::Queue)"
dnf install -y mesa-libGLES-devel mesa-libEGL-devel
dnf install -y gperftools-libs

#Required for NVIDIA in some situations
dnf install -y kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig


#Install RPM fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Add me to dialout so that I can use screen with serial ports
usermod -a -G dialout $1

su - $1 -c "echo *.pro.user$'\n'*.creator.user > .gitignore"
su - $1 -c "git config --global core.excludesfile ~/.gitignore"


#Graphics & office software
dnf install -y inkscape abiword kolourpaint

#It seems to make more sense to use the Gnome spin and then install XFCE
dnf groupinstall -y "Xfce Desktop"
#And KDE for to get Dolphin
dnf groupinstall -y "KDE Plasma Workspaces"

#VS Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update || true
dnf install -y code

# Video, VLC, ffmpeg, OpenCV 
dnf install -y \
    yasm \
    pkg-config \
    curl \
    python-opencv \
    gstreamer1-devel \
    gstreamer1-libav \
    gstreamer1-plugins-base-devel \
    gstreamer1-plugins-base-devel \
    gstreamer1-plugins-bad-free-devel \
    gstreamer1-plugins-bad-nonfree \
    gtk2-devel \
    libzip-devel \
    vlc \
    vlc-devel \
    vlc-core \
    vlc-extras \
    python-devel \
    python-numpy \
    python3-devel \
    python3-numpy \
    libjpeg-devel \
    libtiff-devel \
    atlas-devel \
    atlas-static \
    libpq-devel \
    swig \
    pulseaudio-libs-devel \
    ffmpeg \
    ffmpeg-libs \
    ffmpeg-devel \
    libavdevice

# PostgreSQL
dnf install -y \
    postgresql \
    postgresql-devel \
    postgresql-odbc \
    postgresql-jdbc \
    qt-postgresql \
    qt5-qtbase-postgresql
