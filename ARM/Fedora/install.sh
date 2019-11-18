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

dnf install -y nano parallel

dnf groupinstall -y "Development Tools"
dnf install -y gcc-c++ meld git svn mercurial wget screen cmake git-lfs
dnf install -y SDL2 SDL2-devel
dnf install -y ncurses-devel zlib-devel openssl openssl-develboost-devel freeimage freeimage-devel


#Install RPM fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Add me to dialout so that I can use screen with serial ports
usermod -a -G dialout $1

su - $1 -c "echo *.pro.user$'\n'*.creator.user > .gitignore"
su - $1 -c "git config --global core.excludesfile ~/.gitignore"

