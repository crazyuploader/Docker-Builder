#
# Created by Jugal Kishore --- 2020
#
# Speedtest CLI Docker Image
#
# Using Ubuntu (bionic) as base
FROM ubuntu:bionic

# Update apt packages lists
RUN apt-get update

# Upgrade packages to latest version
RUN apt-get upgrade -y

# Remove unused packages
RUN apt-get -y autoremove --purge

# Install dependencies
RUN apt-get install -y \
                    curl ca-certificates nano \
                    lsb-release mtr nmap

# Install Speedtest CLI
RUN curl -s https://raw.githubusercontent.com/crazyuploader/Bash/master/speedtest.sh | bash -

# Run it
RUN speedtest

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
