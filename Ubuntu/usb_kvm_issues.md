Have a look at:
```
cat /sys/module/usbcore/parameters/autosuspend

```

Edit ```/etc/default/grub``` and modify:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash usbcore.autosuspend=-1"

```

Run:
```
update-grub
reboot

```

Check to see if it worked:
```
cat /sys/module/usbcore/parameters/autosuspend

```