
## M.2 SSD Config

https://alexellisuk.medium.com/upgrade-your-raspberry-pi-4-with-a-nvme-boot-drive-d9ab4e8aa3c2

### Install OS to M.2 SSD 
This can be done on a PC or on the Pi.

Download ***Raspberry Pi OS with desktop and recommended software*** from here:
* https://www.raspberrypi.org/software/operating-systems/

```
dd if=2021-05-07-raspios-buster-armhf-full.img of=/dev/sdg bs=4M conv=fsync

```

### Configure the M.2 boot loader
This only applies if you wish to boot from USB, M.2, or USB SSD.

1. Boot using a a normal Pi OS SD card
2. SSH on to the Pi
3. Update

```
sudo apt update -y
sudo apt upgrade -y

```
4. ```sudo raspi-config```
5. Go to Advanced Options -> Boot Order -> USB Boot.
6. Install the SSD
7. Restart

## Configure Pi OS

Fix the mouse ```nano /boot/cmdline.txt``` add:
```
usbhid.mousepoll=0

```


```
# Enable ssh
sudo raspi-config
ifconfig

```

SSH onto Pi
```
ssh pi@192.168.1.101

ssh-keygen

nano .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
exit

passwd
sudo apt update -y
sudo apt upgrade -y

```


```nano .profile``` and ```nano .bashrc``` and add:
```
export PATH=${PATH}:~/projects/general/tp_tools/scripts

```
```
mkdir -p projects/general
cd projects/general
git clone git@tdpe.co.uk:/opt/git/tp_tools.git

```

Start installing stuff
```
sudo apt install -y \
    g++ \
    cmake \
    git \
    git-lfs \
    wget \
    curl \
    parallel \
    libboost-all-dev \
    libssl-dev

```

Install Qt
```
sudo apt install -y \
    qtcreator \
    qt5-default \
    build-essential

```

## Argon M.2 Drivers
```
curl https://download.argon40.com/argon1.sh | bash

```
Use the shortcuts on the desktop to configure.