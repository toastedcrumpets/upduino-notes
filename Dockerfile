FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    python3-pip \
  && rm -rf /var/lib/apt/lists/*

#First we install apio
RUN pip install apio

RUN apio install oss-cad-suite

#apio deprecated its package manager in favour of a prebuilt toolchain
#RUN wget -c https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-09-23/oss-cad-suite-linux-x64-20230923.tgz -O - | tar -xz -C /opt
#ENV PATH="$PATH:/opt/oss-cad-suite/bin"

#Blinky example
# https://blog.idorobots.org/entries/upduino-fpga-tutorial.html
ADD 00-blinky /projects/00-blinky
RUN cd /projects/00-blinky && apio init -b upduino3 -p .