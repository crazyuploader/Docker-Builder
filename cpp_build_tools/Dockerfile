#
# Created by Jugal Kishore -- 2020
#
# Base Image: Ubuntu
FROM ubuntu:latest

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
                    git curl wget clang g++ gcc nano \
                    ca-certificates

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Custom Functions
RUN curl https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.bashrc

# Setting Git Identity
RUN git config --global user.name "49350241+crazyuploader@users.noreply.github.com" && \
    git config --global user.name "crazyuploader"

CMD ["bash"]