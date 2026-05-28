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
    jq \
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

# Install Ansible collections into system-wide path so USER ansible can find them
RUN ansible-galaxy collection install -p /usr/share/ansible/collections \
        community.general \
        community.docker \
        ansible.posix && \
    chmod -R a+rX /usr/share/ansible/collections

# Create ansible user
RUN addgroup ansible && \
    adduser -D -s /bin/bash -G ansible ansible && \
    mkdir -p /ansible/playbooks /ansible/inventory /ansible/roles /home/ansible/.ssh && \
    chown -R ansible:ansible /ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh

# Install sendme
RUN ARCH="$(uname -m)" && \
    case "$ARCH" in \
        x86_64)  TARGET="linux-x86_64" ;; \
        aarch64) TARGET="linux-aarch64" ;; \
        *) echo "Unsupported: $ARCH" && exit 1 ;; \
    esac && \
    URL="$(curl -fsSL --retry 3 https://api.github.com/repos/n0-computer/sendme/releases/latest | jq -er --arg t "$TARGET" '[.assets[] | select(.name | contains($t)) | select(.name | endswith(".tar.gz")) | .browser_download_url] | .[0]')" && \
    curl -fsSL "$URL" | tar xzf - -C /usr/local/bin

# Set working directory
WORKDIR /ansible

# Switch to ansible user
USER ansible

# Write ansible.cfg
RUN printf '[defaults]\nhost_key_checking = False\nstdout_callback = yaml\ninterpreter_python = auto_silent\n' \
    > /ansible/ansible.cfg

CMD ["bash"]
