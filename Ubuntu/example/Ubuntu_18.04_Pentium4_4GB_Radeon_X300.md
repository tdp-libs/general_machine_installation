# Using tdp-libs on Ubuntu 18.04 Pentium 4 
These are the steps I took to install tdp-libs on Ubuntu 18.04 running on a Dell Dimension 5150 with a Pentium 4, 4GB of RAM, and a Radeon X300.

## Setup
### Basic Setup
I installed Ubuntu from USB stick and then install Xfce and kde, this left me with a broken xorg. After uninstalling all xorg packages and reinstalling it started to work and I could use Xfce.

Next I cloned the git repo that I keep installation scripts in:
```
git clone https://github.com/tdp-libs/general_machine_installation.git

su 
cd general_machine_installation/Ubuntu/
./install.sh

```

### Install tdp_tools
These are a set of scripts that I use for managing git repos. Basically you need to clone them and add the scripts folder to your PATH.

Follow the instructions here:  
https://github.com/tdp-libs/tdp_tools

### Install Qt Creator
Go to the Qt Creator download page, download it, and install.

## Building the tdp-libs OpenGL example
So now we should have a working development environment so lets download and build the [example_maps_fps](https://github.com/tdp-libs/example_maps_fps) program. Follow the instructions in the wiki and build the program in Qt Creator.

There were a few missing packages so lets install apt-file and search for the missing header files as they come up.
```
#As root
apt install apt-file
apt-file update

apt-file find gl3.h
apt install -y libgles2-mesa-dev

apt-file find FreeImage.h
apt install -y libfreeimage-dev

apt-file find SDL.h
apt install -y libsdl2-dev

apt-file find ft2build.h
apt install -y libfreetype6-dev

```
Once those packages were install the program buit and ran but OpenGL was clearly broke. The following command revealed that this video card only supported up to 'OpenGL ES 2.0' but tdp-libs were trying to use ES 3.
```
glxinfo
```
A quick hack in ```tp_maps_sdl/src/Map.cpp``` got us a context.
```
#if 0
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);

  SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 4);
  SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
  //SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 32);
#endif

#if 1
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY);

  //SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 4);
  SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
  //SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 32);
#endif

```
But now we got shader errors. Adding the following to the top level project.inc file changes the shader version. Take a look at ```tp_maps/inc/tp_maps/Globals.h``` for more details of what this is doing.
```
DEFINES += TP_GLES3_100

```
After this change we get a working but clunky program.

## Future Work
So this example highlights a floor in how tp_maps works. Everything happens at compile time, both of these changes could have been at runtime befor creating a context.

## Screen Tearing
So this GPU exhibits quite bad screen tearing so to address this use ```lspci``` to identify the GPU.
```
tom@tom-Dell-DM051:~$ lspci 
00:00.0 Host bridge: Intel Corporation 82945G/GZ/P/PL Memory Controller Hub (rev 02)
00:01.0 PCI bridge: Intel Corporation 82945G/GZ/P/PL PCI Express Root Port (rev 02)
00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definition Audio Controller (rev 01)
00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 1 (rev 01)
00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Controller #1 (rev 01)
00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Controller #2 (rev 01)
00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Controller #3 (rev 01)
00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Controller #4 (rev 01)
00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI Controller (rev 01)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev e1)
00:1f.0 ISA bridge: Intel Corporation 82801GB/GR (ICH7 Family) LPC Interface Bridge (rev 01)
00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Controller (rev 01)
00:1f.2 IDE interface: Intel Corporation NM10/ICH7 Family SATA Controller [IDE mode] (rev 01)
00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller (rev 01)
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV370 [Radeon X300]
01:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV370 [Radeon X300 SE]
03:03.0 Multimedia video controller: Internext Compression Inc iTVC16 (CX23416) Video Decoder (rev 01)
03:08.0 Ethernet controller: Intel Corporation NM10/ICH7 Family LAN Controller (rev 01)
```
From the above we can see that the GPU is a 'Radeon X300 SE'.

```
nano /usr/share/X11/xorg.conf.d/20-radeon.conf
```
To be continued...
