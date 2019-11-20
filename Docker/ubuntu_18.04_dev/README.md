
## Build and install the docker image on your system
```
docker build -t ubuntu_18.04_dev .
mkdir ~/.config.ubuntu_18.04_dev

```

## Run bash
```
docker run \
    -it \
    --env="DISPLAY" \
    --net=host \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_18.04_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_18.04_dev \
    bash

```

## Run qtcreator
```
docker run \
    -it \
    --env="DISPLAY" \
    --net=host \
    -v "/home/tom/projects:/home/tom/projects:rw" \
    -v "/home/tom/.Xauthority:/home/tom/.Xauthority:rw" \
    -v "/home/tom/.config.ubuntu_18.04_dev:/home/tom/.config:rw" \
    -v "/home/tom/.ssh:/home/tom/.ssh:ro" \
    ubuntu_18.04_dev \
    qtcreator

```



