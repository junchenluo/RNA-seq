# 基于ubuntu镜像构建
FROM ubuntu:latest

LABEL \
    description="Image for tools used in RNA sequence analysis"

RUN apt-get update -y && apt-get install -y \
    build-essential \
    bzip2 \
    cmake \
    default-jdk \
    git \
    libnss-sss \
    libtbb2 \
    libtbb-dev \
    ncurses-dev \
    nodejs \
    python-dev \
    python-pip \
    tzdata \
    unzip \
    wget \
    zlib1g \
    zlib1g-dev \
    libncurses5-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    r-base \
    r-base-dev

##############
#HISAT2 2.1.0#
##############

RUN mkdir /opt/hisat2/ \
    && wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip \
    && unzip -d /opt/hisat2/ hisat2-2.1.0-Linux_x86_64.zip \
    && ln -s /opt/hisat2/hisat2-2.1.0/hisat2 /usr/bin/hisat2 \
    && rm hisat2-2.1.0-Linux_x86_64.zip

#################
#StringTie 2.2.1#
#################

RUN cd /opt \
    && wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-2.2.1.Linux_x86_64.tar.gz \
    && tar -xzvf stringtie-2.2.1.Linux_x86_64.tar.gz \
    && mv stringtie-2.2.1.Linux_x86_64 stringtie \
    && cd \
    && ln -s /opt/stringtie/stringtie /usr/bin/stringtie \
    && rm stringtie-2.2.1.Linux_x86_64.tar.gz

##############
#Htslib 1.3.2#
##############
ENV HTSLIB_INSTALL_DIR=/opt/htslib-1.3.2

WORKDIR /tmp
RUN cd /opt && \
    wget https://github.com/samtools/htslib/releases/download/1.3.2/htslib-1.3.2.tar.bz2 && \
    tar --bzip2 -xvf htslib-1.3.2.tar.bz2 && \
    cd /htslib-1.3.2 && \
    ./configure  --enable-plugins --prefix=$HTSLIB_INSTALL_DIR && \
    make && \
    make install && \
    cp $HTSLIB_INSTALL_DIR/libhts.so* /usr/lib/ && \
    cd .. && \
    rm htslib-1.3.2.tar.bz2

################
#SAMtools 1.3.1#
################
ENV SAMTOOLS_INSTALL_DIR=/opt/samtools

WORKDIR /tmp
RUN cd /opt && \
    wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 && \
    tar --bzip2 -xf samtools-1.3.1.tar.bz2 && \
    cd /samtools-1.3.1 && \
    ./configure --with-htslib=$HTSLIB_INSTALL_DIR --prefix=$SAMTOOLS_INSTALL_DIR && \
    make && \
    make install && \
    cd .. && \
    rm samtools-1.3.1.tar.bz2

############################
#R, BiocManager packages, ballgown#
############################

RUN R -e 'install.packages("BiocManager")' \
    && R -e 'BiocManager::install("ballgown")' \
    && R -e 'install.packages("genefilter")' \
    && R -e 'install.packages("dplyr")' \
    && R -e 'install.packages("devtools")' 


