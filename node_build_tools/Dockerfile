#
# Jugal Kishore -- 2020
#
# Docker Image with Nodejs, and NPM installed
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update, upgrade, install, autoremove in one layer
RUN apt-get update && \
    apt-get --yes upgrade && \
    apt-get install --yes --no-install-recommends \
        git curl wget zip unzip vim nano \
        tar zip unzip locales-all gpg \
        openssh-client xz-utils tmux screen \
        iputils-ping traceroute jq tree \
        ca-certificates 1> /dev/null && \
    apt-get --yes autoremove --purge && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js (refreshes apt lists via NodeSource setup)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install --yes --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install global Node.js tools
RUN npm install --global npm@latest && \
    npm install --global prettier@latest && \
    npm install --global yarn@latest && \
    npm install --global pnpm@latest

# Version check
RUN node --version && npm --version && yarn --version && pnpm --version

CMD ["bash"]
