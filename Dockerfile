FROM ubuntu:bionic

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl git python bc tar make wget gcc clang libssl-dev zip
RUN apt-get -y autoremove
RUN mkdir kernel
RUN cd kernel && \
       git clone --depth=1 https://github.com/crazyuploader/AnyKernel3.git anykernel
RUN cd kernel && \
       git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 gcc
RUN cd kernel && \
       git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 gcc32
RUN cd kernel && \
       mkdir clang-r377782b && \
       cd clang-r377782b && \
       wget -nv https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r377782b.tar.gz && \
       tar -xf clang-r377782b.tar.gz && \
       rm clang-r377782b.tar.gz
RUN ls
RUN ls kernel/
