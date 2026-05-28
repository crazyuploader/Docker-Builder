#
# Jugal Kishore -- 2020
#
# All the required tools for Python coding and stuff
FROM ubuntu:resolute

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Upating packages list
RUN apt-get update

# Upgrading packages
RUN apt-get --yes upgrade

# Removing unused packages
RUN apt-get --yes autoremove --purge

# Installing packages
RUN apt-get install --yes --no-install-recommends \
    git curl python3 python3-pip wget nano \
    tar zip unzip locales-all \
    python-is-python3 gpg openssh-client xz-utils \
    iputils-ping traceroute tmux screen \
    gpg jq python3-venv tree 1> /dev/null

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install pip packages
RUN pip install --no-cache-dir --break-system-packages \
    flake8 \
    pyflakes \
    black \
    csvtomd \
    requests

# Install uv (latest via official installer)
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR=/usr/local/bin sh

CMD ["bash"]
