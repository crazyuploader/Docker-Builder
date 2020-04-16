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
                    curl git python bc tar make wget gcc libssl-dev \
                    zip unzip speedtest-cli ca-certificates

# Custom Functions
RUN curl https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Removing all unused packages
RUN apt-get -y autoremove --purge

# APT clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Directory to store cross-compilers
RUN mkdir toolchains

# ARM Cross Compiler
RUN echo -e "Cloning Toolchains...\n" && \
    echo "Getting AOSP ARM Cross Compiler..." && \
    cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 gcc

# ARM_64 Cross Compiler
RUN echo "Getting AOSP ARM_64 Cross Compiler..." && \
    cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 gcc32

# Downloading Prebuilt AOSP Clang
RUN echo "Cloning Clang..." && \
    cd toolchains && \
    git clone --depth=1 https://gitlab.com/crazyuploader/clang-toolchain.git clang

# Setting Git Identity
RUN git config --global user.name "49350241+crazyuploader@users.noreply.github.com" && \
    git config --global user.name "crazyuploader"

# Setting up an environment variable
ENV TOOLCHAIN /toolchains
ENV CLANG_DIRECTORY /toolchains/clang
ENV GCC_DIRECTORY /toolchains/gcc
ENV GCC32_DIRECTORY /toolchains/gcc32

CMD ["bash"]
