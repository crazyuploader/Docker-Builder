#
# Created by Jugal Kishore --- 2020
#
# Minimal Docker Image with Hugo installed
#
# Base Image: ubuntu:noble
FROM ubuntu:noble

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Setting Hugo Version Variable
ARG HUGO_VERSION=0.147.9

# Installing dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    git \
    curl \
    ca-certificates \
    wget

# Get & Install Hugo from its source
RUN echo "Installing Hugo..." && \
    OS_ARCH="$(arch)" && \
    case ${OS_ARCH} in \
        "x86_64") \
            ARCH="amd64" \
            ;; \
        "aarch64") \
            ARCH="arm64" \
            ;; \
        "*") \
            echo "Unsupported Architecture" \
            exit 1 \
            ;; \
    esac && \
    curl -sLo hugo.deb https://github.com/gohugoio/hugo/releases/download/v"${HUGO_VERSION}"/hugo_"${HUGO_VERSION}"_Linux-"${ARCH}".deb && \
    dpkg -i hugo.deb && \
    rm -rf hugo.deb && \
    printf "\nInstalled!\n\n" && \
    hugo version

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT [ "hugo" ]
