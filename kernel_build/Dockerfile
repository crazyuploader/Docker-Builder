#
# Jugal Kishore -- 2020
#
# All the dependencies requred for Android Kernel Building
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update, upgrade, install, autoremove, clean in one layer
RUN apt-get update && \
    apt-get --yes upgrade && \
    apt-get install --yes --no-install-recommends \
        curl git python3 bc tar make wget gcc libssl-dev \
        zip unzip ca-certificates gpg openssh-client \
        nano vim xz-utils tmux screen jq tree 1> /dev/null && \
    apt-get -y autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Create toolchains directory
RUN mkdir toolchains

# Clone ARM cross-compiler
RUN cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 gcc

# Clone ARM64 cross-compiler
RUN cd toolchains && \
    git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 gcc32

# Clone Clang toolchain
RUN cd toolchains && \
    git clone --depth=1 https://gitlab.com/crazyuploader/clang-toolchain.git clang

# Install kernel build script
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/main/kbuild.sh && \
    mkdir ~/misc && \
    mv ./kbuild.sh ~/misc && \
    cd ~/misc && \
    chmod +x kbuild.sh && \
    printf "\nalias kbuild=\"~/misc/kbuild.sh\"" >> ~/.bashrc

# Install sendme
RUN ARCH="$(uname -m)" && \
    case "$ARCH" in \
        x86_64)  TARGET="linux-x86_64" ;; \
        aarch64) TARGET="linux-aarch64" ;; \
        *) echo "Unsupported: $ARCH" && exit 1 ;; \
    esac && \
    URL="$(curl -fsSL --retry 3 https://api.github.com/repos/n0-computer/sendme/releases/latest | jq -er --arg t "$TARGET" '[.assets[] | select(.name | contains($t)) | select(.name | endswith(".tar.gz")) | .browser_download_url] | .[0]')" && \
    curl -fsSL --retry 3 -o /tmp/sendme.tar.gz "$URL" && \
    tar -xzf /tmp/sendme.tar.gz -C /usr/local/bin && \
    rm -f /tmp/sendme.tar.gz

# Environment variables
ENV TOOLCHAIN=/toolchains
ENV CLANG=/toolchains/clang/bin/clang
ENV GCC=/toolchains/gcc/bin/aarch64-linux-android-
ENV GCC32=/toolchains/gcc32/bin/arm-linux-androideabi-

CMD ["bash"]
