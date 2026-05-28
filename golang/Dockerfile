#
# Created by Jugal Kishore --- 2025
#
# Minimal Docker Image with Golang and GoReleaser
FROM alpine:latest

# Set terminal type
ENV TERM=xterm-256color

# Install build dependencies and tools
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    git \
    ca-certificates \
    build-base \
    openssl-dev \
    sqlite-dev \
    clang

# Install Go (latest stable fetched from go.dev API)
RUN GO_VERSION=$(curl -s 'https://go.dev/dl/?mode=json' | jq -r '.[0].version') && \
    ARCH=$(arch) && \
    case "$ARCH" in \
        x86_64)  GO_ARCH="amd64" ;; \
        aarch64) GO_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -fsSLo go.tar.gz https://go.dev/dl/${GO_VERSION}.linux-${GO_ARCH}.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz

# Set Go environment variables
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Create Go workspace directory
RUN mkdir -p /go

# Install GoReleaser (latest fetched from GitHub API)
RUN GORELEASER_TAG=$(curl -s https://api.github.com/repos/goreleaser/goreleaser/releases/latest | jq -r '.tag_name') && \
    ARCH=$(arch) && \
    case "$ARCH" in \
        x86_64)  RELEASER_ARCH="x86_64" ;; \
        aarch64) RELEASER_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -fsSLo releaser.tar.gz https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_TAG}/goreleaser_Linux_${RELEASER_ARCH}.tar.gz && \
    tar -xzf releaser.tar.gz goreleaser && \
    mv goreleaser /usr/local/bin/goreleaser && \
    chmod +x /usr/local/bin/goreleaser && \
    rm releaser.tar.gz

# Set working directory
WORKDIR /go

CMD ["bash"]
