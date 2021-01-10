#
# Jugal Kishore -- 2020
#
# All the dependencies requred for Android Kernel Building
#
# Using Ubuntu as a base OS
FROM ubuntu:bionic

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Updating apt packages list
RUN apt-get update

# Upgrading apt packages to latest
RUN apt-get -y upgrade

# Installing required packages
RUN apt-get install -y \
                    curl git python bc tar make wget gcc libssl-dev \
                    zip unzip speedtest-cli ca-certificates gpg gpg-agent ssh \
                    nano xz-utils tmux screen jq 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

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
RUN printf "Cloning Toolchains...\n" && \
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

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Setting Kernel Build Script
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/kbuild.sh && \
    mkdir ~/misc && \
    mv ./kbuild.sh ~/misc && \
    cd ~/misc && \
    chmod +x kbuild.sh && \
    printf "\nalias kbuild=\"~/misc/kbuild.sh\"" >> ~/.bashrc

# Setting Git Identity
RUN git config --global user.email "49350241+crazyuploader@users.noreply.github.com" && \
    git config --global user.name "crazyuploader"

# Setting up an environment variable
ENV TOOLCHAIN /toolchains
ENV CLANG /toolchains/clang/bin/clang
ENV GCC /toolchains/gcc/bin/aarch64-linux-android-
ENV GCC32 /toolchains/gcc32/bin/arm-linux-androideabi-

CMD ["bash"]
