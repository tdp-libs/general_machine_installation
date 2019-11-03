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


