FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

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
