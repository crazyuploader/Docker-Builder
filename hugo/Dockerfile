#
# Created by Jugal Kishore --- 2020
#
# Minimal Docker Image with Hugo installed
#
# Base Image: crazyuploader/minimal_ubuntu
FROM crazyuploader/minimal_ubuntu:latest

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Setting Hugo Version Variable
ARG HUGO_VERSION=0.87.0

# Get & Install Hugo from its source
RUN echo "Installing Hugo..." && \
    curl -sLo hugo.deb https://github.com/gohugoio/hugo/releases/download/v"${HUGO_VERSION}"/hugo_"${HUGO_VERSION}"_Linux-64bit.deb && \
    dpkg -i hugo.deb && \
    rm -rf hugo.deb && \
    printf "\nInstalled!\n\n" && \
    hugo version

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

CMD ["bash"]
