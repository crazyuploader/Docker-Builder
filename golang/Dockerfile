#
# Created by Jugal Kishore --- 2025
#
# Minimal Docker Image with Golang, Releaser installed
#
# Base Image: ubuntu:noble
FROM ubuntu:noble

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Setting Golang Version Variable
ARG GOLANG_VERSION=1.24.4

# Setting Releaser Version Variable
ARG RELEASER_VERSION=2.11.2

# Installing dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    git curl ca-certificates wget git build-essential && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Get the Golang version
RUN ARCH="$(dpkg --print-architecture)" && \
    case "$ARCH" in \
        amd64) ARCH="amd64" ;; \
        arm64) ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;; \
    esac && \
    curl -fsSL -o go.tar.gz https://go.dev/dl/go"${GOLANG_VERSION}".linux-"${ARCH}".tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm -rf go.tar.gz && \
    printf "\nInstalled!\n\n"

# Set Golang Environment Variables
ENV GOROOT=/usr/local/go
RUN mkdir -p /go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Install Releaser
RUN ARCH="$(dpkg --print-architecture)" && \
    case "$ARCH" in \
        amd64) RELEASER_ARCH="x86_64" ;; \
        arm64) RELEASER_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;; \
    esac && \
    curl -fsSL -o releaser.tar.gz https://github.com/goreleaser/goreleaser/releases/download/v${RELEASER_VERSION}/goreleaser_Linux_${RELEASER_ARCH}.tar.gz && \
    tar -xzf releaser.tar.gz && \
    mv goreleaser /usr/local/bin/ && \
    chmod +x /usr/local/bin/goreleaser && \
    rm -rf releaser.tar.gz

# Set the working directory
WORKDIR /go

# Set the default command
CMD ["bash"]
