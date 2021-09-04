
## Build and install the docker image on your system
```
docker build -t alpine_3.13_dev .
mkdir ~/.config.alpine_3.13_dev

```

## Run root
```
touch /usr/bin/alpine_3.13_dev.root
chmod +x /usr/bin/alpine_3.13_dev.root
nano /usr/bin/alpine_3.13_dev.root

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
    -v "/home/tom/.config.alpine_3.13_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    alpine_3.13_dev \
    bash

```

## Run bash
```
touch /usr/bin/alpine_3.13_dev.bash
chmod +x /usr/bin/alpine_3.13_dev.bash
nano /usr/bin/alpine_3.13_dev.bash

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
    -v "/home/tom/.config.alpine_3.13_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    alpine_3.13_dev \
    bash

```

