#
# Jugal Kishore -- 2020
#
# Docker Image all about networking
#
# Base Image: Ubuntu
FROM ubuntu:latest

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

# Install dependencies
RUN apt-get install -y \
                    curl wget ca-certificates nano \
                    lsb-release mtr nmap iputils-ping \
                    traceroute tcptraceroute gpg gpg-agent \
                    net-tools bc jq 1> /dev/null

# Install tcping
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tcping.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

CMD ["bash"]
