#
# Jugal Kishore -- 2020
#
# All the required tools for Python coding and stuff
#
# Base Image: Ubuntu
FROM ubuntu:latest

# Upating packages list
RUN apt-get update

# Upgrading packages
RUN apt-get -y upgrade

# Removing unused packages
RUN apt-get -y autoremove --purge

# Installing packages
RUN apt-get install -y          \
                    git          \
                    curl          \
                    python3        \
                    python3-pip     \
                    tmate            \
                    wget              \
                    nano               \
                    tar                 \
                    zip                  \
                    unzip                 \
                    speedtest-cli          \
                    locales-all

# Custom Functions
RUN curl https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Installing pip packages
RUN pip3 install --upgrade pip && \
    pip3 install flake8 pyflakes black

# Setting Git Identity
RUN git config --global user.name "49350241+crazyuploader@users.noreply.github.com" && \
    git config --global user.name "crazyuploader"

CMD ["bash"]
