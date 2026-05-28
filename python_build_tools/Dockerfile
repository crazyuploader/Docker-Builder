#
# Jugal Kishore -- 2020
#
# All the required tools for Python coding and stuff
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update packages
RUN apt-get update

# Upgrade packages
RUN apt-get --yes upgrade

# Remove unused packages
RUN apt-get --yes autoremove --purge

# Install packages
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

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR=/usr/local/bin sh

# Install sendme
RUN ARCH="$(uname -m)" && \
    case "$ARCH" in \
        x86_64)  TARGET="linux-x86_64" ;; \
        aarch64) TARGET="linux-aarch64" ;; \
        *) echo "Unsupported: $ARCH" && exit 1 ;; \
    esac && \
    URL="$(curl -fsSL --retry 3 https://api.github.com/repos/n0-computer/sendme/releases/latest | jq -er --arg t "$TARGET" '[.assets[] | select(.name | contains($t)) | select(.name | endswith(".tar.gz")) | .browser_download_url] | .[0]')" && \
    curl -fsSL "$URL" | tar xzf - -C /usr/local/bin

CMD ["bash"]
