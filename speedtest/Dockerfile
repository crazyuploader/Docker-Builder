#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM alpine:latest

# Installing Dependencies
RUN apk --no-cache add wget

# Build time Environment Variable
ARG VERSION="1.0.0"

# Install Speedtest CLI
RUN set -e && \
    ARCH=$(arch) && \
    if ! wget --quiet --output-document /tmp/speedtest.tar.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-"${ARCH}"-linux.tgz; \
    then \
        echo "Getting Speedtest Failed"; \
        exit 1; \
    fi

# Extracting Speedtest CLI, and putting in /usr/bin
RUN tar xf /tmp/speedtest.tar.tgz
RUN mv ./speedtest /usr/bin
RUN rm speedtest*

# Cleaning up
RUN apk --no-cache del wget

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

ENTRYPOINT ["/usr/bin/speedtest"]
