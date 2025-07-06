#
# Jugal Kishore -- 2020
#
# All the required tools for Python coding and stuff
#
# Base Image: ubuntu:noble
FROM ubuntu:noble

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Upating packages list
RUN apt-get update

# Upgrading packages
RUN apt-get --yes upgrade

# Removing unused packages
RUN apt-get --yes autoremove --purge

# Installing packages
RUN apt-get install --yes --no-install-recommends \
    git curl python3 python3-pip wget nano \
    tar zip unzip locales-all \
    python-is-python3 gpg openssh-client xz-utils \
    iputils-ping traceroute tmux screen \
    gpg jq python3-venv tree 1> /dev/null

# Install tmate
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Installing pip packages
RUN pip install --no-cache-dir --break-system-packages \
    flake8 \
    pyflakes \
    black \
    csvtomd \
    requests

# Custom Functions
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
