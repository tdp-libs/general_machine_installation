#!/bin/bash
set -xe

mkdir ~/temp
cd ~/temp

wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
tar -zxvf boost_1_69_0.tar.gz
cd boost_1_69_0/
./bootstrap.sh
./b2 install -j$(nproc)

cd
rm -rf ~/temp
