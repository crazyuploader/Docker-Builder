#
# Created by Jugal Kishore --- 2023
#
# Markdown Server based on https://github.com/xyproto/algernon
FROM golang:alpine AS builder

# Install build tools and version fetching deps
RUN apk --no-cache add git curl jq

# Set working directory
WORKDIR /tmp

# Fetch latest Algernon release tag from GitHub API and clone
RUN ALGERNON_VERSION=$(curl -s https://api.github.com/repos/xyproto/algernon/releases/latest | jq -r '.tag_name') && \
    git clone --depth=1 https://github.com/xyproto/algernon -b ${ALGERNON_VERSION}

# Set working directory to cloned repo
WORKDIR /tmp/algernon

# Build Algernon binary
RUN go build -o algernon . && \
    mv algernon /usr/bin/algernon

# Compress binary on x86_64 (upx not available for arm)
RUN if [ "$(arch)" = "x86_64" ]; then apk add --no-cache upx && upx /usr/bin/algernon; fi

# Clean up build artifacts
RUN rm -rf /tmp/*

# Final stage — scratch for minimal image size
FROM scratch

# Copy Algernon binary from builder
COPY --from=builder /usr/bin/algernon /usr/bin/algernon

# Copy required tmp directory
COPY --from=builder /tmp /tmp

# Mount point for content to serve
VOLUME /srv/algernon
WORKDIR /srv/algernon

# Expose port 3000
EXPOSE 3000

# Serve /srv/algernon on port 3000 over HTTP
ENTRYPOINT [ "algernon", "--simple", "--addr", ":3000", "--httponly", "/srv/algernon" ]
