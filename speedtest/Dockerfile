#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM alpine:latest

# Installing Dependencies
RUN apk --no-cache add wget

# Install Speedtest CLI
RUN wget -q https://github.com/crazyuploader/SpeedTest_Official_CLI/raw/main/linux/speedtest && \
    chmod +x ./speedtest && \
    mv ./speedtest /usr/bin

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

ENTRYPOINT ["/usr/bin/speedtest"]
