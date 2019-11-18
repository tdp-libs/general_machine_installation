## Fedora ARM Development

```
dnf install -y uboot-images-armv7 arm-image-installer

```

Download Fedora Minimal from https://arm.fedoraproject.org/

As root:
```
arm-image-installer --supported


arm-image-installer \
    --media /dev/mmcblk0 \
    --target=orangepi_zero \
    --image=Fedora-Minimal-armhfp-30-1.2-sda.raw.xz \
    --resizefs \
    --addkey=`realpath ~tom/.ssh/id_rsa.pub` \
    --relabel

```

## Cross Compilation
```
dnf install -y gcc-c++-arm-linux-gnu binutils-arm-linux-gnu gcc-arm-linux-gnu glibc-arm-linux-gnu

# Used to run Fedora in QEMU
dnf install -y libguestfs-tools virt-manager qemu-system-arm

```

Build a Fedora root filesystem.
```
unxz -k Fedora-Minimal-armhfp-30-1.2-sda.raw.xz
virt-builder --get-kernel Fedora-Minimal-armhfp-30-1.2-sda.raw 

```
https://fedoraproject.org/wiki/QA:Testcase_Virt_ARM_on_x86

```
mv Fedora-Minimal-armhfp-30-1.2-sda.raw \
   vmlinuz-5.0.9-301.fc30.armv7hl \
   initramfs-5.0.9-301.fc30.armv7hl.img \
   /var/lib/libvirt/images/

```

```
   25  dnf install -y qemu-user gcc-c++-arm-linux-gnu
   26  dnf install -y gcc-c++-arm-linux-gnu binutils-arm-linux-gnu gcc-arm-linux-gnu glibc-arm-linux-gnu
   27  exit
   28  dnf install -y virt-manager
   29  dnf install -y qemu-system-arm
   30  ls -al /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw
   31  chmod 666 /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw
   32  ls -al /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw
   33  qemu-img resize /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw +10G
   34  screen /dev/pts/5 115200
   35  mv Fedora-Minimal-armhfp-30-1.2-sda.raw vmlinuz-5.0.9-301.fc30.armv7hl initramfs-5.0.9-301.fc30.armv7hl.img /var/lib/libvirt/images/
   36  virt-manager
   37  qemu-img resize -f raw /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw +10G
   38  exit
   39  dnf install -y libguestfs-tools
   40  screen /dev/pts/5
   41  screen /dev/pts/5 115200
   42  ls /dev/pts/
   43  screen /dev/pts/4 115200
   44  virt-cat -a /var/lib/libvirt/images/Fedora-Minimal-armhfp-30-1.2-sda.raw  /etc/extlinux.conf
   45  ifconfig
   46  screen /dev/pts/3 115200
   47  arm-image-installer     --media /dev/mmcblk0     --target=orangepi_zero     --image=Fedora-Minimal-armhfp-30-1.2-sda.raw.xz     --resizefs     --addkey=`realpath ~tom/.ssh/id_rsa.pub` \
   48  arm-image-installer --media /dev/mmcblk0 --target=orangepi_zero --image=Fedora-Minimal-armhfp-31-1.9-sda.raw.xz --resizefs --addkey=`realpath ~tom/.ssh/id_rsa.pub` --relabel
   49  dd if=/dev/mmcblk0 of=prepared.raw
   50  virt-builder --get-kernel prepared.raw 
   51  dnf install -y libguestfs-tools-c
   52  dnf update -y
   53  rm -rf /var/lib/libvirt/images/*
   54  mv prepared.raw vmlinuz-5.3.7-301.fc31.armv7hl initramfs-5.3.7-301.fc31.armv7hl.img /var/lib/libvirt/images/
   55  history

```

```
  371  unxz -k Fedora-Minimal-armhfp-31-1.9-sda.raw.xz 
  372  virt-builder --get-kernel Fedora-Minimal-armhfp-31-1.9-sda.raw

```
