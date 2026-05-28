#
# Created by Jugal Kishore --- 2025
#
# Minimal Docker Image with Golang and GoReleaser
FROM alpine:latest

# Terminal type
ENV TERM=xterm-256color

# Install dependencies
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

# Install Go
RUN API_JSON="$(curl -fsSL --retry 3 'https://go.dev/dl/?mode=json')" && \
    GO_VERSION="$(echo "${API_JSON}" | jq -er '.[0].version')" && \
    ARCH="$(arch)" && \
    case "$ARCH" in \
        x86_64)  GO_ARCH="amd64" ;; \
        aarch64) GO_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    GO_SHA256="$(echo "${API_JSON}" | jq -er --arg f "${GO_VERSION}.linux-${GO_ARCH}.tar.gz" '.[0].files[] | select(.filename == $f) | .sha256')" && \
    curl -fsSLo go.tar.gz "https://go.dev/dl/${GO_VERSION}.linux-${GO_ARCH}.tar.gz" && \
    echo "${GO_SHA256}  go.tar.gz" | sha256sum -c - && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz

# Go environment variables
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Create Go workspace
RUN mkdir -p /go

# Install GoReleaser
RUN GORELEASER_TAG="$(curl -fsSL --retry 3 https://api.github.com/repos/goreleaser/goreleaser/releases/latest | jq -er '.tag_name')" && \
    ARCH="$(arch)" && \
    case "$ARCH" in \
        x86_64)  RELEASER_ARCH="x86_64" ;; \
        aarch64) RELEASER_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -fsSLo checksums.txt "https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_TAG}/checksums.txt" && \
    curl -fsSLo releaser.tar.gz "https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_TAG}/goreleaser_Linux_${RELEASER_ARCH}.tar.gz" && \
    EXPECTED="$(grep "goreleaser_Linux_${RELEASER_ARCH}.tar.gz$" checksums.txt | awk '{print $1}')" && \
    [ -n "$EXPECTED" ] && echo "${EXPECTED}  releaser.tar.gz" | sha256sum -c - && \
    tar -xzf releaser.tar.gz goreleaser && \
    mv goreleaser /usr/local/bin/goreleaser && \
    chmod +x /usr/local/bin/goreleaser && \
    rm releaser.tar.gz checksums.txt

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

# Set working directory
WORKDIR /go

CMD ["bash"]
