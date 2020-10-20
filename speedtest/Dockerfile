#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Ubuntu (bionic) as base
FROM ubuntu:bionic

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
                    curl ca-certificates nano \
                    lsb-release mtr nmap iputils-ping \
                    traceroute

# Install Speedtest CLI
RUN curl -s https://raw.githubusercontent.com/crazyuploader/Bash/master/speedtest.sh | bash -

# Accept license & run it
RUN speedtest --accept-license || \
    speedtest --accept-gdpr

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
