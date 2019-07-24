#!/bin/bash
set -xe

add-apt-repository -y ppa:graphics-drivers/ppa
apt-get update -y 
apt-get install -y  nvidia-driver-418

