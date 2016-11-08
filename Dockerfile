FROM sdthirlwall/raspberry-pi-cross-compiler
MAINTAINER Gareth Jones <joneszone1975@gmail.com>

LABEL Description="This image is used to build the Able/Pipsta utilities (fpu ...) for the Raspberry Pi"

RUN install-debian doxygen ninja-build pkgconf

ENV DEFAULT_DOCKCROSS_IMAGE=geordiejones/raspberry-pi-cross-compiler

WORKDIR /opt
RUN git clone -b release https://gitlab.kitware.com/cmake/cmake.git
WORKDIR /opt/cmake
RUN ./bootstrap && make && make install
WORKDIR /opt
RUN rm -rf cmake

WORKDIR /build
ENTRYPOINT [ "/rpxc/entrypoint.sh" ]
