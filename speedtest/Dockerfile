#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM alpine:3.18 AS builder

# Installing Dependencies
RUN apk --no-cache add wget curl jq

# Set API URL
ARG API_URL="https://api.devjugal.com/speedtest_latest"

# Setting Work Directory
WORKDIR /tmp

# Install Speedtest CLI
RUN set -e && \
    ARCH=$(arch) && \
    JSON=$(curl --silent "$API_URL") && \
    DOWNLOAD_URL=$(echo "$JSON" | jq -r ".links.linux[\"$ARCH\"]") && \
    if [ -z "$DOWNLOAD_URL" ]; then \
        echo "Architecture $ARCH not supported or download link not found."; \
        exit 1; \
    fi && \
    wget --quiet --output-document speedtest.tar.tgz "$DOWNLOAD_URL" && \
    tar xf speedtest.tar.tgz && \
    mv speedtest /usr/bin/speedtest

# Using Alpine as base image
FROM alpine:3.18 AS runner

# Copy Speedtest CLI binary to /usr/bin
COPY --from=builder /usr/bin/speedtest /usr/bin/speedtest

# Accept License Agreement & GDPR License
RUN /usr/bin/speedtest \
    --accept-license \
    --accept-gdpr

# Ensure the ENTRYPOINT includes license acceptance
ENTRYPOINT ["/usr/bin/speedtest", "--accept-license", "--accept-gdpr"]
