#
# Jugal Kishore -- 2020
#
# Docker Image all about networking
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

# Install dependencies
RUN apt-get install -y \
                    curl wget ca-certificates nano \
                    lsb-release mtr nmap iputils-ping \
                    traceroute tcptraceroute 1> /dev/null

# Install tcping
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/tcping.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]