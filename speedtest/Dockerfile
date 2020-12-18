#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Alpine as base
FROM alpine

# Update packages lists
RUN apk update

# Install dependencies
RUN apk add wget

# Install Speedtest CLI
RUN wget -q https://github.com/crazyuploader/SpeedTest_Official_CLI/raw/main/linux/speedtest && \
    chmod +x ./speedtest && \
    mv ./speedtest /usr/bin

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

ENTRYPOINT ["/usr/bin/speedtest"]
