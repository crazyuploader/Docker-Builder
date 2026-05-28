#
# Jugal Kishore -- 2020
#
# Docker Image with Nodejs, and NPM installed
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
    git curl wget zip unzip vim nano \
    tar zip unzip locales-all gpg \
    openssh-client xz-utils tmux screen \
    iputils-ping traceroute jq tree \
    ca-certificates 1> /dev/null

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install global Node.js tools
RUN npm install --global npm@latest && \
    npm install --global prettier@latest && \
    npm install --global yarn@latest && \
    npm install --global pnpm@latest

# Version check
RUN echo "Node Version: $(node --version)" && \
    echo "NPM Version: $(npm --version)" && \
    echo "Yarn Version: $(yarn --version)" && \
    echo "PNPM Version: $(pnpm --version)"

CMD ["bash"]
