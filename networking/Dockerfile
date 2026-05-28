#
# Jugal Kishore -- 2020
#
# Docker Image all about networking
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update packages
RUN apt-get update

# Upgrade packages
RUN apt-get upgrade --yes

# Remove unused packages
RUN apt-get --yes autoremove --purge

# Install packages
RUN apt-get install --yes --no-install-recommends \
    curl wget ca-certificates nano \
    lsb-release mtr-tiny nmap iputils-ping \
    traceroute tcptraceroute gpg \
    net-tools bc jq tree openssh-client 1> /dev/null

# Install tcping
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tcping.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

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
