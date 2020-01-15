#!/bin/bash
set -xe

apt-get update -y
apt-get install -y libssl-dev
apt-get autoremove -y

QT_VERSION=$1

mkdir ~/qt
cd ~/qt 

git clone git://code.qt.io/qt/qt5.git
cd qt5
git checkout ${QT_VERSION}
perl init-repository
cd ..
mkdir buildQt5
cd buildQt5/

../qt5/configure \
    -prefix /opt/qt${QT_VERSION} \
    -developer-build \
    -opensource \
    -nomake examples \
    -nomake tests \
    -confirm-license

make -j`nproc`

make install

cd ~
rm -rf ~/qt
