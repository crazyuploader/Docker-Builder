#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
FROM alpine:latest AS builder

# Install deps
RUN apk add --no-cache curl jq

# Set working directory
WORKDIR /app

# Install lychee
RUN VERSION="$(curl -fsSL --retry 3 https://api.github.com/repos/lycheeverse/lychee/releases/latest | jq -er '.tag_name')" && \
    [ -n "$VERSION" ] && [ "$VERSION" != "null" ] && \
    ARCH="$(arch)" && \
    curl -fsSL --retry 3 -o lychee.tar.gz "https://github.com/lycheeverse/lychee/releases/download/${VERSION}/lychee-${ARCH}-unknown-linux-musl.tar.gz" && \
    tar --strip-components=1 -xf lychee.tar.gz "lychee-${ARCH}-unknown-linux-musl/lychee" && \
    chmod +x lychee

# Runner stage
FROM alpine:latest AS runner

# Install CA certificates for TLS
RUN apk add --no-cache ca-certificates

# Create non-root user
RUN addgroup -S appuser && adduser -S -G appuser appuser

# Copy lychee binary
COPY --from=builder /app/lychee /usr/local/bin/lychee

# Switch to non-root user
USER appuser

ENTRYPOINT [ "lychee" ]
CMD ["--help"]
