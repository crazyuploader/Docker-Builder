#
# Jugal Kishore -- 2020
#
# All the dependencies requred for Android Kernel Building
#
# Using Ubuntu as a base OS
FROM ubuntu:bionic

# Updating apt packages list
RUN apt-get update

# Upgrading apt packages to latest
RUN apt-get -y upgrade

# Installing required packages
RUN apt-get install -y \
                    curl \
                    git \
                    python \
                    bc \
                    tar \
                    make \
                    wget \
                    gcc \
                    clang\
                    libssl-dev \
                    zip

# Removing all unused packages
RUN apt-get -y autoremove

# Directory to store cross-compilers
RUN mkdir toolchains

# ARM Cross Compiler
RUN echo "Cloning Toolchains..." && \
    cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 gcc

# ARM_64 Cross Compiler
RUN cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 gcc32

# Downloading Prebuilt AOSP Clang
RUN echo "Downloading Clang 10.0.4..." && \
    cd toolchains && \
    mkdir clang-r377782b && \
    cd clang-r377782b && \
    wget -nv https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r377782b.tar.gz && \
    tar -xf clang-r377782b.tar.gz && \
    rm clang-r377782b.tar.gz

# Setting up an environment variable
ENV TOOLCHAIN /toolchains
