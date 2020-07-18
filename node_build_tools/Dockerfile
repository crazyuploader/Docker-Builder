#
# Jugal Kishore -- 2020
#
# Docker Image with Nodejs, NPM and Angular CLI installed
#
# Using "ubuntu:focal" as Base Image
FROM ubuntu:focal

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Upating packages list
RUN apt-get update

# Upgrading packages
RUN apt-get -y upgrade

# Removing unused packages
RUN apt-get -y autoremove --purge

# Installing packages
RUN apt-get install -y --no-install-recommends \
                    git curl wget zip unzip nodejs npm nano \
                    tar zip unzip speedtest-cli locales-all gpg ssh xz-utils 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/tmate.sh | bash -

# Installing Yarn
RUN npm install --global yarn@1.22.4

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Git Identity Setup
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nbash /git_identity.sh" >> ~/.bashrc

CMD ["bash"]
