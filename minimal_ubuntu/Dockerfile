#
# Jugal Kishore -- 2020
#
# Minimal Docker Image on top of Ubuntu (focal), including git, and some other necessary stuffs
#
# Base Image: ubuntu:noble
FROM ubuntu:noble

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Upating packages list
RUN apt-get update

# Removing unused packages
RUN apt-get --yes autoremove --purge

# Installing packages
RUN apt-get install --yes --no-install-recommends \
    git curl wget zip unzip nano tar zip unzip \
    mtr-tiny dnsutils iputils-ping traceroute \
    python3 python-is-python3 locales-all \
    gpg openssh-client xz-utils ca-certificates \
    tmux screen jq tree bc 1> /dev/null

# Install tmate
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
