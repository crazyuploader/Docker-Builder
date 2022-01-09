#
# Jugal Kishore -- 2020
#
# Docker Image with Nodejs, and NPM installed
#
# Using "ubuntu:focal" as Base Image
FROM ubuntu:focal

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Upating packages list
RUN apt-get update

# Upgrading packages
RUN apt-get -y upgrade

# Removing unused packages
RUN apt-get -y autoremove --purge

# Installing packages
RUN apt-get install -y --no-install-recommends \
                    git curl wget zip unzip vim nano \
                    tar zip unzip locales-all gpg \
                    ssh xz-utils gpg-agent tmux screen \
                    iputils-ping traceroute jq tree \
                    ca-certificates 1> /dev/null

# Setting up NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

# Install tmate
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Installing Prettier, Yarn
RUN npm install --global npm@latest && \
    npm install --global prettier@latest && \
    npm install --global yarn@latest

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

# Displaying Versions
RUN echo "Node Version: $(node --version)" && \
    echo "NPM Version: $(npm --version)" && \
    echo "Yarn Version: $(yarn --version)"

CMD ["bash"]
