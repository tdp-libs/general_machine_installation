## Fedora 35
```
dnf update -y
dnf install -y kernel-devel kernel-headers libglvnd-devel

```

Add ```GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau nouveau.modeset=0"``` to:
```
nano /etc/sysconfig/grub
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

```

```
chmod +x NVIDIA-Linux-x86_64-495.46.run
./NVIDIA-Linux-x86_64-495.46.run

```

After rebooting MATE crashes on login but Gnone was working, see: https://forums.developer.nvidia.com/t/495-46-xorg-sigsegv-in-fedora-35-only-on-msi-mpg-trident3-and-only-for-mate-desktop/199076/9

```
wget https://developer.download.nvidia.com/compute/cuda/11.5.1/local_installers/cuda_11.5.1_495.29.05_linux.run
chmod +x cuda_11.5.1_495.29.05_linux.run
./cuda_11.5.1_495.29.05_linux.run

```

Extract cuDNN and copy it:
```
cp -a include/* /usr/local/cuda-11.5/include/.
cp -a lib/* /usr/local/cuda-11.5/lib64/.

```

## NVIDIA Drivers And CUDA

```
wget https://developer.download.nvidia.com/compute/cuda/repos/fedora29/x86_64/cuda-repo-fedora29-10.1.105-1.x86_64.rpm
rpm -i cuda-repo-fedora29-10.1.105-1.x86_64.rpm
dnf --disablerepo="rpmfusion-nonfree*" install -y cuda

```

Download and unpack cudnn from NVIDIA and then:
```
cp -a cuda/include/* /usr/local/cuda-10.1/include/.
cp -a cuda/lib64/* /usr/local/cuda-10.1/lib64/.

```

You may also want to edit ```/etc/sysconfig/grub``` and change this:
```
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau nouveau.modeset=0"

```
```
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

```


## Reboot
You will need to reboot so that the NVIDIA kernel module gets loaded before trying to use CUDA.

If GUI does not start:
```
ln -snf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

```

## NVIDIA Settings
Change ```X Server Display Configuration --> Advanced --> Force Full Composition Pipeline``` and save to ```/etc/X11/xorg.conf.d/11-nvidia-settings.conf``` as root.
```
su -
nvidia-settings

```

# Install docker
Optional step to install NVIDIA docker.

## Get NVIDIA docker 
https://github.com/NVIDIA/nvidia-docker/issues/706#issuecomment-382578153

```
mkdir -p /var/lib/nvidia-docker-repo 
cd /var/lib/nvidia-docker-repo
git clone -b gh-pages https://github.com/NVIDIA/libnvidia-container.git
git clone -b gh-pages https://github.com/NVIDIA/nvidia-container-runtime.git
git clone -b gh-pages https://github.com/NVIDIA/nvidia-docker.git

```

### List the supported versions of docker
```
ls -l nvidia-container-runtime/centos7/x86_64/

```

## Get a supported version of docker latest version of docker
https://docs.docker.com/install/linux/docker-ce/fedora/

```
dnf install -y dnf-plugins-core

#I could not get NVIDIA docker working with Fedora docker-ce
#  dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
#Instead CentOS seems to work
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

```

### List the available versions of docker
```
dnf list docker-ce  --showduplicates | sort -r
dnf list docker-ce-cli  --showduplicates | sort -r

```

### Install a version of docker that is supported by nvidia-docker
```
dnf install -y docker-ce-3:18.09.6-3.el7 docker-ce-cli-1:18.09.6-3.el7 containerd.io docker-compose

systemctl start docker
docker run hello-world
systemctl enable docker

usermod -aG docker tom

```

## Install NVIDIA docker
```
cd /var/lib/nvidia-docker-repo
rpm --import /var/lib/nvidia-docker-repo/nvidia-docker/gpgkey
rpm -i libnvidia-container/centos7/x86_64/libnvidia-container1-1.0.5-1.x86_64.rpm 
rpm -i libnvidia-container/centos7/x86_64/libnvidia-container-tools-1.0.5-1.x86_64.rpm 
rpm -i nvidia-container-runtime/centos7/x86_64/nvidia-container-runtime-hook-1.4.0-2.x86_64.rpm 

```

### Add hooks that match the docker version installed
```
docker --version

rpm -i nvidia-container-runtime/centos7/x86_64/nvidia-container-runtime-2.0.0-3.docker18.09.6.x86_64.rpm 
rpm -i nvidia-docker/centos7/x86_64/nvidia-docker2-2.0.3-3.docker18.09.6.ce.noarch.rpm 

systemctl restart docker
systemctl enable docker

```

### Run bash in NVIDIA docker
```
docker run -it --runtime=nvidia --rm nvidia/cuda:10.1-base bash

```

```
# Does this run?
nvidia-smi

# If not does this fix it?
ldconfig
nvidia-smi

```

### Make NVIDIA docker the default
```nano /etc/docker/daemon.json``` and set default-runtime to nvidia.
```
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}

```

```
systemctl restart docker
docker run --rm nvidia/cuda:10.1-base nvidia-smi

```

### Lock the version of the packages
```
dnf install python3-dnf-plugin-versionlock.noarch
dnf list installed "*docker*"
dnf versionlock add \
    docker-ce.x86_64 \
    docker-ce-cli.x86_64 \
    docker-compose.noarch \
    nvidia-docker2.noarch \
    python3-docker.noarch \
    python3-docker-pycreds.noarch \
    python3-dockerpty.noarch

```
