#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Base Image: alpine:3.22
FROM alpine:3.23 AS builder

# Installing Dependencies
RUN apk --no-cache add curl jq

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
    curl -sLo speedtest.tar.tgz "$DOWNLOAD_URL" && \
    tar xf speedtest.tar.tgz && \
    mv speedtest /usr/bin/speedtest

# Base Image: alpine:3.22
FROM alpine:3.23 AS runner

# Copy Speedtest CLI binary to /usr/bin
COPY --from=builder /usr/bin/speedtest /usr/bin/speedtest

# Accept License Agreement & GDPR License with a timeout
RUN ( /usr/bin/speedtest --accept-license --accept-gdpr & sleep 2 && kill $! ) || true

# Ensure the ENTRYPOINT includes license acceptance
ENTRYPOINT ["/usr/bin/speedtest", "--accept-license", "--accept-gdpr"]
