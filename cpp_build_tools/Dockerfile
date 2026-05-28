#
# Created by Jugal Kishore -- 2020
#
# CPP & C Build Tools
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
    build-essential git curl wget \
    clang g++ gcc nano ca-certificates \
    locales-all gpg jq tar xz-utils screen \
    tmux tree openssh-client 1> /dev/null

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
