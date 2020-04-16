#
# Created by Jugal Kishore --- 2020
#
# Base Image: Ubuntu
FROM ubuntu:latest

# Update Packages list
RUN apt-get update

# Upgrade Packages to latest
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install -y --no-install-recommends \
                    git curl nano ca-certificates openjdk-8-jdk \
                    wget zip unzip

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Download Gradle
RUN mkdir /opt/gradle && \
    wget -q https://services.gradle.org/distributions/gradle-6.3-all.zip && \
    unzip -d gradle* /opt/gradle && \
    ls /opt/gradle && \
    rm gradle*.zip