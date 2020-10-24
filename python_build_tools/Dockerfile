#
# Jugal Kishore -- 2020
#
# All the required tools for Python coding and stuff
#
# Base Image: Ubuntu
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
                    git curl python3 python3-pip wget nano \
                    tar zip unzip speedtest-cli locales-all \
                    python-is-python3 gpg ssh xz-utils 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Custom Functions
RUN curl https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Installing pip packages
RUN pip3 install --upgrade pip && \
    pip install flake8 pyflakes black csvtomd

# Git Identity Setup
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
