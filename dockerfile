FROM ubuntu:18.04

RUN apt-get update -y && apt-get install -y wget \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    tree

# bioinformatics toolbox
RUN mkdir soft

# samtools-1.12 released 17.03.2021
WORKDIR /soft/samtools-1.12
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
    tar -xf samtools-1.12.tar.bz2 -C /soft/samtools-1.12 && \
    cd samtools-1.12 && \
    ./configure && \
    make && \
    make install

CMD ["samtools"]