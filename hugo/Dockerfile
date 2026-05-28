#
# Created by Jugal Kishore --- 2020
#
# Minimal Docker Image with Hugo installed
FROM alpine:latest

# Terminal type
ENV TERM=xterm-256color

# Install dependencies
RUN apk add --no-cache \
    git \
    curl \
    jq \
    ca-certificates

# Install Hugo
RUN TAG="$(curl -fsSL --retry 3 https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -er '.tag_name')" && \
    VERSION="${TAG#v}" && \
    ARCH="$(arch)" && \
    case "$ARCH" in \
        x86_64)  HUGO_ARCH="amd64" ;; \
        aarch64) HUGO_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac && \
    curl -fsSLo checksums.txt "https://github.com/gohugoio/hugo/releases/download/${TAG}/hugo_${VERSION}_checksums.txt" && \
    curl -fsSLo hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/${TAG}/hugo_${VERSION}_linux-${HUGO_ARCH}.tar.gz" && \
    EXPECTED="$(grep "hugo_${VERSION}_linux-${HUGO_ARCH}.tar.gz$" checksums.txt | awk '{print $1}')" && \
    [ -n "$EXPECTED" ] && echo "${EXPECTED}  hugo.tar.gz" | sha256sum -c - && \
    tar -xzf hugo.tar.gz hugo && \
    mv hugo /usr/local/bin/hugo && \
    chmod +x /usr/local/bin/hugo && \
    rm hugo.tar.gz checksums.txt && \
    hugo version

ENTRYPOINT ["hugo"]
