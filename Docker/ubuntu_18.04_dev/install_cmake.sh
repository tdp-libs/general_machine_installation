#!/bin/bash
set -xe

apt-get update -y
apt-get install -y libssl-dev
apt-get remove -y --purge --auto-remove cmake
apt-get autoremove -y

mkdir ~/temp
cd ~/temp

version=3.16
build=2
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/

./bootstrap
make -j$(nproc)
sudo make install

cmake --version

cd
rm -rf ~/temp
