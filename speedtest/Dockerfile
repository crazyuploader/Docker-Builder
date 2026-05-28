#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
FROM alpine:3.23 AS builder

# Install dependencies
RUN apk --no-cache add curl jq

# API URL for latest speedtest binary
ARG API_URL="https://api.devjugal.com/speedtest_latest"

# Set working directory
WORKDIR /tmp

# Install Speedtest
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

# Runner stage
FROM alpine:3.23 AS runner

# Copy binary
COPY --from=builder /usr/bin/speedtest /usr/bin/speedtest

# Accept license
RUN ( /usr/bin/speedtest --accept-license --accept-gdpr & sleep 2 && kill $! ) || true

ENTRYPOINT ["/usr/bin/speedtest", "--accept-license", "--accept-gdpr"]
