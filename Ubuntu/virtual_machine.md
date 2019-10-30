
# Install 
```
apt install -y qemu-kvm libvirt-clients virt-manager
adduser --group libvirtd
adduser tom libvirtd

```
Logout and back in.

# Test
```
virsh -c qemu:///system list

```

# Run
System -> Virtual Machine Manager

