#
# Created by Jugal Kishore --- 2023
#
# Markdown Server based on https://github.com/xyproto/algernon
FROM golang:alpine AS builder

# Install deps
RUN apk --no-cache add git curl jq

# Set working directory
WORKDIR /tmp

# Clone Algernon
RUN ALGERNON_VERSION="$(curl -s https://api.github.com/repos/xyproto/algernon/releases/latest | jq -r '.tag_name')" && \
    git clone --depth=1 https://github.com/xyproto/algernon -b "${ALGERNON_VERSION}"

# Set working directory to repo
WORKDIR /tmp/algernon

# Build Algernon
RUN go build -o algernon . && \
    mv algernon /usr/bin/algernon

# Compress binary
RUN if [ "$(arch)" = "x86_64" ]; then apk add --no-cache upx && upx /usr/bin/algernon; fi

# Clean up
RUN rm -rf /tmp/*

# Runner stage
FROM scratch

# Copy binary
COPY --from=builder /usr/bin/algernon /usr/bin/algernon

# Copy tmp directory
COPY --from=builder /tmp /tmp

# Content volume
VOLUME /srv/algernon

# Set working directory
WORKDIR /srv/algernon

# Expose port
EXPOSE 3000

# Serve content
ENTRYPOINT [ "algernon", "--simple", "--addr", ":3000", "--httponly", "/srv/algernon" ]
