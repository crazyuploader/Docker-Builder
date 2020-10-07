#
# Created by Jugal Kishore --- 2020
#
# Minimal Docker Image with Hugo installed
#
# Base Image: crazyuploader/minimal_ubuntu
FROM crazyuploader/minimal_ubuntu:latest

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting Hugo Version Variable
ARG HUGO_VERSION=0.76.2

# Get & Install Hugo from its source
RUN echo "Installing Hugo..." && \
    curl -sLo hugo.deb https://github.com/gohugoio/hugo/releases/download/v"${HUGO_VERSION}"/hugo_"${HUGO_VERSION}"_Linux-64bit.deb && \
    dpkg -i hugo.deb && \
    rm -rf hugo.deb && \
    printf "\nInstalled!"

CMD ["bash"]
