#
# Created by Jugal Kishore --- 2023
#
# Markdown Server based on https://github.com/xyproto/algernon
#
# Base Image: alpine:3.18
FROM golang:1.22.0-alpine AS builder

# Setting Algernon Version
ARG ALGERNON_VERSION=v1.15.1

# Adding curl
RUN apk --no-cache add git

# Setting Working Directory to /tmp
WORKDIR /tmp

# Clone algernon repository
RUN git clone https://github.com/xyproto/algernon -b ${ALGERNON_VERSION}

# Setting working directory to /tmp/algernon
WORKDIR /tmp/algernon

# Extract Algernon binaries
RUN go build -o algernon . && \
    mv algernon /usr/bin/algernon

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
