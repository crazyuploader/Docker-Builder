#
# Created by Jugal Kishore --- 2025
#
# Docker Image for Ansible Runner
#
# Base Image: python:3.11-slim
FROM python:3.11-slim

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Installing dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    openssh-client

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Set the default command
CMD ["bash"]
