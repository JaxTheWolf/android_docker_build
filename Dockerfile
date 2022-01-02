FROM ubuntu:bionic
 
# Setup build directory and root user
WORKDIR /android-build
USER root
 
# Install dependencies
RUN apt-get -y update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    build-essential \
    file \
    apt-utils \
    repo \
    flex \
    bison \
    gperf \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    lib32ncurses5-dev \
    uuid \
    uuid-dev \
    liblz-dev \
    liblzo2-2 \
    liblzo2-dev \
    lzop \
    u-boot-tools \
    mtd-utils \
    android-tools-fsutils \
    openjdk-8-jdk \
    device-tree-compiler \
    gdisk \
    m4 \
    libz-dev \
    bc \
    rsync \
    git \
    gnupg \
    libncurses5 \
    lib32z1-dev \
    fontconfig \
    ccache \
    jq \
    bsdmainutils \
    nano \
    python \
    python3 \
    openssl \
    python-pip \
    python-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg8-dev \
    zlib1g-dev

RUN ccache -M 100G

RUN apt-get purge -y --auto-remove && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

COPY ${PWD}/build_rom /bin