#
# Jugal Kishore -- 2020
#
# Docker Image all about networking
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update packages
RUN apt-get update

# Upgrade packages
RUN apt-get upgrade --yes

# Remove unused packages
RUN apt-get --yes autoremove --purge

# Install packages
RUN apt-get install --yes --no-install-recommends \
    curl wget ca-certificates nano \
    lsb-release mtr-tiny nmap iputils-ping \
    traceroute tcptraceroute gpg \
    net-tools bc jq tree openssh-client 1> /dev/null

# Install tcping
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tcping.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
