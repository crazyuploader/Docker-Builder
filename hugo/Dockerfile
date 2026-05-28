#
# Created by Jugal Kishore --- 2020
#
# Minimal Docker Image with Hugo installed
FROM alpine:latest

# Set terminal type
ENV TERM=xterm-256color

# Install dependencies
# git required for Hugo .GitInfo and LastMod from VCS
RUN apk add --no-cache \
    git \
    curl \
    jq \
    ca-certificates

# Install Hugo (latest stable fetched from GitHub API)
RUN TAG=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '.tag_name') && \
    VERSION=${TAG#v} && \
    ARCH=$(arch) && \
    case "$ARCH" in \
        x86_64)  HUGO_ARCH="amd64" ;; \
        aarch64) HUGO_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -sLo hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/${TAG}/hugo_${VERSION}_linux-${HUGO_ARCH}.tar.gz && \
    tar -xzf hugo.tar.gz hugo && \
    mv hugo /usr/local/bin/hugo && \
    chmod +x /usr/local/bin/hugo && \
    rm hugo.tar.gz && \
    hugo version

ENTRYPOINT ["hugo"]
