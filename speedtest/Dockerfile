#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM alpine:latest

# Installing Dependencies
RUN apk --no-cache add wget bash

# Build time Environment Variable
ARG VERSION="1.0.0"
ARG SHELL=/bin/bash

# Copy helper script
COPY speedtest/helper.sh /tmp/helper.sh

# Install Speedtest CLI
RUN cd /tmp && \
    bash helper.sh && \
    tar xf /tmp/speedtest.tar.tgz && \
    mv ./speedtest /usr/bin && \
    rm speedtest* helper.sh

# Cleaning up
RUN apk --no-cache del wget bash

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

ENTRYPOINT ["/usr/bin/speedtest"]
