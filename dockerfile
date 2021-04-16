FROM ubuntu:18.04

RUN apt-get update -y && apt-get install -y wget \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    tree \
    pkg-config \
    libbladerf-dev && \
    apt update -y && apt install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt install -y gcc-9 g++-9 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9

# samtools-1.12 released 17.03.2021
WORKDIR /soft
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
    tar -xf samtools-1.12.tar.bz2 && \
    cd samtools-1.12 && \
    ./configure && \
    make && \
    make install

# libdeflate-1.7 released 10.11.2020
WORKDIR /soft
RUN wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.7.tar.gz && \
    tar -xzf v1.7.tar.gz && \
    cd libdeflate-1.7 && \
    make && \
    make install

# libmaus-2.0.776 released 12.04.2021
WORKDIR /soft
RUN wget https://gitlab.com/german.tischler/libmaus2/-/archive/2.0.776-release-20210412110908/libmaus2-2.0.776-release-20210412110908.tar.bz2 && \
    tar -xf libmaus2-2.0.776-release-20210412110908.tar.bz2 && \
    cd libmaus2-2.0.776-release-20210412110908 && \
    ./configure && \
    make && \
    make install
 
# biobambam2-2.0.182 released 12.04.2021
WORKDIR /soft
RUN wget https://gitlab.com/german.tischler/biobambam2/-/archive/2.0.182-release-20210412001032/biobambam2-2.0.182-release-20210412001032.tar.bz2 && \
    tar -xf biobambam2-2.0.182-release-20210412001032.tar.bz2 && \
    cd biobambam2-2.0.182-release-20210412001032 && \
    ./configure --with-libmaus2=/soft && \
    make install

# some cleaning
WORKDIR /soft
RUN rm *.tar.bz2 && rm *tar.gz && \
    mv biobambam2-2.0.182-release-20210412001032 biobambam2-2.0.182 && \
    mv libmaus2-2.0.776-release-20210412110908 libmaus2-2.0.776

WORKDIR /soft
CMD ls
