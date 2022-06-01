#
# Created by Jugal Kishore -- 2020
#
# Java Build Tools
#
# Base Image: Ubuntu
FROM ubuntu:jammy

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Update apt packages lists
RUN apt-get update

# Upgrade packages to latest version
RUN apt-get upgrade -y

# Remove unused packages
RUN apt-get -y autoremove --purge

# Install essential packages
RUN apt-get install -y --no-install-recommends \
                    git curl wget default-jdk nano \
                    tar xz-utils zip unzip \
                    locales-all shellcheck screen tmux \
                    ant maven gpg gpg-agent ssh jq tree 1> /dev/null

# Install tmate
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Custom Functions
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
