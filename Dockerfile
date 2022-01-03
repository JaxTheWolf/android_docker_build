FROM ubuntu:bionic
 
# Setup build directory and root user
WORKDIR /android-build
USER root
 
# Install dependencies
RUN apt-get -y update && apt-get upgrade -y

RUN apt-get install -y \
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
    lib32z-dev \
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
    kmod \
    imagemagick \
    lib32readline-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libwxgtk3.0-gtk3-dev \
    libxml2 \
    pngcrush \
    schedtool \
    squashfs-tools
    
RUN ccache -M 100G

RUN apt-get purge -y --auto-remove && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

COPY ${PWD}/build_rom /bin
