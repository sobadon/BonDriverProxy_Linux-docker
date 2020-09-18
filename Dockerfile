FROM ubuntu:18.04 AS bdp-build

RUN apt update && \
    apt install -y \
    git \
    build-essential \
    automake \
    autoconf \
    && apt clean

RUN git clone https://github.com/u-n-k-n-o-w-n/BonDriverProxy_Linux bdp
WORKDIR /bdp
RUN make
# /bdp/BonDriver_Proxy.so

RUN git clone https://github.com/dogeel/recbond
WORKDIR /bdp/recbond
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
# /usr/local/bin/recbond
# /usr/local/bin/recpt1ctl



