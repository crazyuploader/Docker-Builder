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
    openssh-client \
    sshpass \
    rsync \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Install Ansible and common Python dependencies
RUN pip3 install --upgrade --no-cache-dir pip && \
    pip3 install --no-cache-dir \
    ansible \
    ansible-core \
    pyyaml \
    jinja2 \
    netaddr \
    jmespath \
    && pip3 cache purge

# Install common Ansible collections
RUN ansible-galaxy collection install \
    community.general \
    community.docker \
    ansible.posix

# Create ansible user and directories
RUN useradd -m -s /bin/bash ansible && \
    mkdir -p /ansible/playbooks /ansible/inventory /ansible/roles /home/ansible/.ssh && \
    chown -R ansible:ansible /ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh

# Set working directory
WORKDIR /ansible

# Switch to ansible user
USER ansible

# Create default ansible.cfg
RUN echo '[defaults]' > /ansible/ansible.cfg && \
    echo 'host_key_checking = False' >> /ansible/ansible.cfg && \
    echo 'stdout_callback = yaml' >> /ansible/ansible.cfg && \
    echo 'interpreter_python = auto_silent' >> /ansible/ansible.cfg

# Set the default command
CMD ["bash"]
