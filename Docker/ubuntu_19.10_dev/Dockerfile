#Lifted from:
#https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.2/base/Dockerfile
#And then modified to use Ubuntu 19.10

FROM ubuntu:19.10

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.1 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411 brand=tesla,driver>=418,driver<419"

RUN groupadd -g 1000 tom
RUN useradd -l -u 1000 -g tom tom
RUN install -d -m 0755 -o tom -g tom /home/tom

VOLUME ["/home/tom/projects","/home/tom/.config","/home/tom/.ssh"]

COPY 10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
COPY install.sh /root/
COPY install_cmake.sh /root/
COPY install_boost.sh /root/

RUN bash -c /root/install.sh
RUN bash -c /root/install_cmake.sh
RUN bash -c /root/install_boost.sh

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

WORKDIR /home/tom/
USER tom

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
        ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility

ENV XDG_RUNTIME_DIR /tmp

# Required for non-glvnd setups.
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
