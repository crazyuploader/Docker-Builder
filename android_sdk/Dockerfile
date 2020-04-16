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
    unzip -d /opt/gradle gradle* && \
    rm gradle*.zip

# Download Android SDK
RUN mkdir /opt/android-sdk && \
    cd /opt/android-sdk && \
    export ANDROID_HOME="$(pwd)" && \
    wget -q -O command.zip https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip && \
    unzip command.zip>> /dev/null 2>&1 && \
    rm command.zip && \
    ls && \
    yes | ./tools/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-29"