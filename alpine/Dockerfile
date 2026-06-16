#
# Created by Jugal Kishore --- 2022
#
# Simple Alpine Docker Image non-root user 'worker' and sudo access
FROM alpine:3.24.1

# Install sudo
RUN apk --no-cache add sudo

# Add worker user
RUN adduser \
    -D \
    -u 1000 \
    worker

# Grant passwordless sudo
RUN echo 'worker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to worker user
USER worker
