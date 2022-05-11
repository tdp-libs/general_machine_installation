# Using tdp-libs on MSI Stealth GS77
These are the steps I took to install tdp-libs on Fedora 35 on a MSI Stealth GS77 laptop.

## Setup
### Basic Setup
Del to enter BIOS.

Boot from USB, use basic UI as usual NVIDIA card fails to initialize.

Wipe everything and install to disk.

Follow the Fedora 35 instructions for the NVIDIA Drivers / CUDA here:
https://github.com/tdp-libs/general_machine_installation/blob/master/Fedora/NVIDIA.md

### XFCE
```
dnf groupinstall 'XFCE Desktop' -y
dnf install lightdm lightdm-gtk -y
systemctl disable gdm.service
systemctl enable lightdm.service
reboot

```

