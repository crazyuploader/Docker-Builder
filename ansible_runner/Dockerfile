#
# Created by Jugal Kishore --- 2025
#
# Docker Image for Ansible Runner
FROM python:3.14-alpine

# Terminal type
ENV TERM=xterm-256color

# Install runtime deps
RUN apk add --no-cache \
    bash \
    git \
    curl \
    openssh-client \
    sshpass \
    rsync

# Install Ansible and Python deps
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        python3-dev \
        libffi-dev \
        openssl-dev && \
    pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir \
        ansible \
        pyyaml \
        jinja2 \
        netaddr \
        jmespath && \
    pip cache purge && \
    apk del .build-deps

# Install Ansible collections
RUN ansible-galaxy collection install \
    community.general \
    community.docker \
    ansible.posix

# Create ansible user
RUN addgroup ansible && \
    adduser -D -s /bin/bash -G ansible ansible && \
    mkdir -p /ansible/playbooks /ansible/inventory /ansible/roles /home/ansible/.ssh && \
    chown -R ansible:ansible /ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh

# Set working directory
WORKDIR /ansible

# Switch to ansible user
USER ansible

# Write ansible.cfg
RUN printf '[defaults]\nhost_key_checking = False\nstdout_callback = yaml\ninterpreter_python = auto_silent\n' \
    > /ansible/ansible.cfg

CMD ["bash"]
