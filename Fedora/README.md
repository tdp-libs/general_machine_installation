## Prepare SD Card
```
dd if=Fedora-Workstation-Live-x86_64-35-1.2.iso of=/dev/sdg bs=4M conv=fsync

```

## Common Development Tools
Run as root and change tom for your user name:
```
./install.sh tom

```

## Video Drivers
* [NVIDIA](https://github.com/tdp-libs/general_machine_installation/blob/master/Fedora/NVIDIA.md)

## Tools
* [tp_tools](https://github.com/tdp-libs/tp_tools)
* [QtCreator](https://github.com/tdp-libs/general_machine_installation/blob/master/Fedora/QtCreator.md)
* [Android Studio](https://github.com/tdp-libs/general_machine_installation/blob/master/Fedora/AndroidStudio.md)
* [Emscripten](https://github.com/tdp-libs/tp_maps_emcc)


## Libraries
* [Caffe2](https://github.com/tdp-libs/tp_pipeline_caffe2)
* [TheiaSfM](https://github.com/tdp-libs/tp_pipeline_theia)
* [PCL](https://github.com/tdp-libs/tp_pipeline_pcl)
* [COLMAP](https://github.com/tdp-libs/tp_pipeline_colmap)
* [OpenCV](https://github.com/tdp-libs/tp_pipeline_opencv)
