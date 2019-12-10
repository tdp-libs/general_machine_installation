
## Build and install the docker image on your system
```
docker build -t ubuntu_19.10_dev .
mkdir ~/.config.ubuntu_19.10_dev

```

## Run root
```
touch /usr/bin/ubuntu_19.10_dev.root
chmod +x /usr/bin/ubuntu_19.10_dev.root
nano /usr/bin/ubuntu_19.10_dev.root

```
```
#!/bin/bash
docker run \
    --user=root \
    -it \
    --rm \
    --env="DISPLAY" \
    --net=host \
    --ipc=host \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    -v "/mnt:/mnt:rw" \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_19.10_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_19.10_dev \
    bash

```

## Run bash
```
touch /usr/bin/ubuntu_19.10_dev.bash
chmod +x /usr/bin/ubuntu_19.10_dev.bash
nano /usr/bin/ubuntu_19.10_dev.bash

```
```
#!/bin/bash
docker run \
    -it \
    --rm \
    --env="DISPLAY" \
    --net=host \
    --ipc=host \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    -v "/mnt:/mnt:rw" \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_19.10_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_19.10_dev \
    bash

```

## Run qtcreator
```
touch /usr/bin/ubuntu_19.10_dev.qtcreator
chmod +x /usr/bin/ubuntu_19.10_dev.qtcreator
nano /usr/bin/ubuntu_19.10_dev.qtcreator

```
```
#!/bin/bash
docker run \
    --rm \
    --env="DISPLAY" \
    --net=host \
    --ipc=host \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    -v "/mnt:/mnt:rw" \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_19.10_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_19.10_dev \
    qtcreator

```
