#!/bin/bash
set -xe

apt remove -y --purge --auto-remove cmake

mkdir ~/temp
cd ~/temp

version=3.15
build=5
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/

./bootstrap
make -j$(nproc)
sudo make install

cmake --version

cd
rm -rf ~/temp
