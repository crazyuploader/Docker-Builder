#
# Created by Jugal Kishore --- 2023
#
# Markdown Server based on https://github.com/xyproto/algernon
#
# Base Image: alpine:3.18
FROM alpine:3.18 AS builder

# Setting Algernon Version
ARG ALGERNON_VERSION=1.15.1

# Adding curl
RUN apk --no-cache add curl

# Setting Working Directory to /tmp
WORKDIR /tmp

# Check OS Architecture, and download Algernon binaries
RUN OS_ARCH="$(arch)" && \
    case ${OS_ARCH} in \
        "x86_64") \
            URL="https://github.com/xyproto/algernon/releases/download/${ALGERNON_VERSION}/algernon-${ALGERNON_VERSION}-linux.tar.xz" \
            ;; \
        "aarch64") \
            URL="https://github.com/xyproto/algernon/releases/download/${ALGERNON_VERSION}/algernon-${ALGERNON_VERSION}-linux_arm64.tar.xz" \
            ;; \
        "*") \
            echo "Unsupported Architecture" \
            exit 1 \
            ;; \
    esac && \
    curl -sLo algernon.tar.xz ${URL}

# Extract Algernon binaries
RUN tar xf algernon.tar.xz && \
    cd algernon* && \
    mv algernon* /usr/bin/algernon

# Compress Algernon binaries
RUN if [[ $(arch) == "x86_64" ]]; then apk add upx; upx /usr/bin/algernon; fi

# Clean up /tmp directory
RUN rm -rf /tmp/*

# Use only Algernon binaries
FROM scratch

# Copy Algernon binaries
COPY --from=builder /usr/bin/algernon /usr/bin/algernon

# Required Directories
COPY --from=builder /tmp /tmp
VOLUME /srv/algernon
WORKDIR /srv/algernon

# Expose 3000 port
EXPOSE 3000

# Entrypoint
#
# Serve /srv/algernon directory with Algernon on port 3000 with HTTP only
ENTRYPOINT [ "algernon", "--simple", "--addr", ":3000", "--httponly", "/srv/algernon" ]
