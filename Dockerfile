FROM ubuntu:20.04 as ubuntu-base

WORKDIR /usr/src/gccsdk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libtool patch wget help2man autogen m4 gcc g++ bison flex subversion gperf sed make build-essential autoconf2.13 automake cvs doxygen dpkg-dev gettext intltool libglib2.0-dev libpopt-dev pkg-config policykit-1 rman subversion unzip wget xsltproc texinfo git libx11-dev tcl subversion docker.io

FROM ubuntu-base as builder

COPY ./gcc4 gcc4

COPY ./gccsdk-params gcc4

ARG NUMPROC=$(nproc)
ARG MAKEFLAGS

RUN cd gcc4 && ./build-world

FROM ubuntu-base
# host Jenkins user is 1001
RUN groupadd jenkins
RUN useradd -r -u 1001 -g jenkins jenkins
USER jenkins

ENV PATH=/home/riscos/cross/bin:${PATH}

WORKDIR /usr/src

COPY --from=builder /home/riscos /home/riscos
COPY ./gccsdk-params /home/riscos

CMD /bin/bash 
