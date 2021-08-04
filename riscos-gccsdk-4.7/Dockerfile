FROM ubuntu:20.04 as ubuntu-base

RUN mkdir -p /home/riscos && \
    chmod 777 /home/riscos && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y libtool patch wget \
      help2man autogen m4 gcc g++ bison flex subversion gperf sed make \
      build-essential autoconf2.13 automake cvs doxygen dpkg-dev gettext \
      intltool libglib2.0-dev libpopt-dev pkg-config policykit-1 rman \
      subversion unzip wget xsltproc texinfo git libx11-dev tcl \
      subversion automake1.11 meson cmake

ENV PATH=/home/riscos/cross/bin:${PATH}

COPY ./home/riscos /home/riscos

CMD /bin/bash 
