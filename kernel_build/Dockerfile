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
RUN apt-get install -y   \
                    curl  \
                    git    \
                    python  \
                    bc       \
                    tar       \
                    make       \
                    wget        \
                    gcc          \
                    clang         \
                    libssl-dev     \
                    zip             \
                    unzip            \
                    speedtest-cli

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

# Setting up an environment variable
ENV TOOLCHAIN /toolchains

CMD ["bash"]
