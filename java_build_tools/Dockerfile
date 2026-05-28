#
# Created by Jugal Kishore -- 2020
#
# Java Build Tools
FROM ubuntu:resolute

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Update apt packages lists
RUN apt-get update

# Upgrade packages to latest version
RUN apt-get upgrade --yes

# Remove unused packages
RUN apt-get --yes autoremove --purge

# Install essential packages
RUN apt-get install --yes --no-install-recommends \
    git curl wget default-jdk nano \
    tar xz-utils zip unzip \
    locales-all shellcheck screen tmux \
    ant maven gpg openssh-client jq tree 1> /dev/null

# Install tmate
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
