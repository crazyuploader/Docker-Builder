#
# Jugal Kishore -- 2020
#
# Minimal Docker Image on top of Ubuntu (focal), including git, and some other necessary stuffs
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update packages
RUN apt-get update

# Remove unused packages
RUN apt-get --yes autoremove --purge

# Install packages
RUN apt-get install --yes --no-install-recommends \
    git curl wget zip unzip nano tar zip unzip \
    mtr-tiny dnsutils iputils-ping traceroute \
    python3 python-is-python3 locales-all \
    gpg openssh-client xz-utils ca-certificates \
    tmux screen jq tree bc 1> /dev/null

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["bash"]
