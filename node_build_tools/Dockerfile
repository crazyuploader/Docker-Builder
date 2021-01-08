#
# Jugal Kishore -- 2020
#
# Docker Image with Nodejs, NPM and Angular CLI installed
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
                    git curl wget zip unzip nodejs npm nano \
                    tar zip unzip speedtest-cli locales-all gpg \
                    ssh xz-utils gpg-agent tmux screen \
                    iputils-ping traceroute 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Installing Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    yarn --version

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Installing Prettier
RUN npm install -g prettier@latest && \
    prettier --version

# Git Identity Setup
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
