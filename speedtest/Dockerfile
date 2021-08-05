#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM --platform=$BUILDPLATFORM alpine:latest

# Installing Dependencies
RUN apk --no-cache add wget bash

# Build time Environment Variable
ARG VERSION="1.0.0"
ARG TARGETPLATFORM

# Install Speedtest CLI
RUN set -ex && \
    wget --quiet --output-document /tmp/speedtest.tar.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-"${TARGETPLATFORM:6}"-linux.tgz || \
    echo "Getting Speedtest Failed!" && \
    exit 1

RUN cd /tmp && \
    tar xf /tmp/speedtest.tar.tgz && \
    mv ./speedtest /usr/bin && \
    rm speedtest*

# Cleaning up
RUN apk --no-cache del wget

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

ENTRYPOINT ["/usr/bin/speedtest"]
