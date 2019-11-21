
## Build and install the docker image on your system
```
docker build -t ubuntu_18.04_dev .
mkdir ~/.config.ubuntu_18.04_dev

```

## Run root
```
touch /usr/bin/ubuntu_18.04_dev.root
chmod +x /usr/bin/ubuntu_18.04_dev.root
nano /usr/bin/ubuntu_18.04_dev.root

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
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_18.04_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_18.04_dev \
    bash

#    -v "/tmp/.X11-unix:/tmp/.X11-unix" \
```

## Run bash
```
touch /usr/bin/ubuntu_18.04_dev.bash
chmod +x /usr/bin/ubuntu_18.04_dev.bash
nano /usr/bin/ubuntu_18.04_dev.bash

```
```
#!/bin/bash
docker run \
    -it \
    --rm \
    --env="DISPLAY" \
    --net=host \
    --ipc=host \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_18.04_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_18.04_dev \
    bash

```

## Run qtcreator
```
touch /usr/bin/ubuntu_18.04_dev.qtcreator
chmod +x /usr/bin/ubuntu_18.04_dev.qtcreator
nano /usr/bin/ubuntu_18.04_dev.qtcreator

```
```
#!/bin/bash
docker run \
    --rm \
    --env="DISPLAY" \
    --net=host \
    --ipc=host \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_18.04_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_18.04_dev \
    qtcreator

```
