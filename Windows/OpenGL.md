
## Visual Studio 
### Download and Install glew
Follow instructions here:  
http://glew.sourceforge.net/install.html


## Mingw
```
export MINGW_BUILD_ROOT=/c/Qt/Tools/mingw730_32/i686-w64-mingw32/
export PATH=/c/Qt/Tools/mingw730_32/bin:/c/Program\ Files/CMake/bin
cmake -G "MinGW Makefiles" \
      -S ../../glew-2.1.0/build/cmake \
      -B . \
      -DCMAKE_INSTALL_PREFIX=${MINGW_BUILD_ROOT}

mingw32-make all
mingw32-make install

```