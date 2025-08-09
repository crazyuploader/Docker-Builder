#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
#
# Base Image: alpine:latest
FROM alpine:latest AS builder

# Add curl command
RUN apk add --no-cache curl

# Set lychee version
ARG VERSION=v0.19.1

# Set Working Directory
WORKDIR /app

# Get lychee based on system architecture
RUN ARCH="$(arch)" && \
    curl -sLo lychee.tar.gz https://github.com/lycheeverse/lychee/releases/download/lychee-${VERSION}/lychee-${ARCH}-unknown-linux-gnu.tar.gz && \
    tar -xvf lychee.tar.gz

# Use ubuntu:noble for final runner
FROM ubuntu:noble AS runner

# Copy lychee binary from builder stage
COPY --from=builder /app/lychee /usr/local/bin

# Entry point for the Docker Image
ENTRYPOINT [ "lychee" ]
CMD ["--help"]
