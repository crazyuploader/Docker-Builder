#
# Created by Jugal Kishore -- 2020
#
# Java Build Tools
#
# Base Image: Ubuntu
FROM ubuntu:focal

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Update apt packages lists
RUN apt-get update

# Upgrade packages to latest version
RUN apt-get upgrade -y

# Remove unused packages
RUN apt-get -y autoremove --purge

# Install essential packages
RUN apt-get install -y --no-install-recommends \
                    git curl wget default-jdk nano \
                    tar xz-utils zip unzip speedtest-cli locales-all shellcheck \
                    ant maven gpg ssh 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Custom Functions
RUN curl https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Git Identity Setup
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
