FROM nvidia/cuda:10.1-devel-ubuntu18.04

RUN groupadd -g 1000 tom
RUN useradd -l -u 1000 -g tom tom
RUN install -d -m 0755 -o tom -g tom /home/tom

VOLUME ["/home/tom/projects","/home/tom/.config","/home/tom/.ssh"]

ADD install.sh /root/
RUN bash -c /root/install.sh

WORKDIR /home/tom/
USER tom
