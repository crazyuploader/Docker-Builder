#
# Created by Jugal Kishore --- 2020
#
# Base Image: Ubuntu
FROM ubuntu:latest

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Update Packages list
RUN apt-get update

# Upgrade Packages to latest
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install -y --no-install-recommends \
                    git curl nano ca-certificates openjdk-8-jdk \
                    wget zip unzip gpg ftp

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Download Gradle
RUN mkdir /opt/gradle && \
    wget -q https://services.gradle.org/distributions/gradle-6.3-all.zip && \
    unzip -d /opt/gradle gradle*>> /dev/null 2>&1 && \
    rm gradle*.zip

# Environment Variables
ENV ANDROID_HOME /opt/android-sdk
ENV GRADLE_HOME /opt/gradle/gradle-6.3
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin

# Download Android SDK
RUN mkdir ~/.android && echo "### User Sources for Android SDK Manager" > ~/.android/repositories.cfg && \
    mkdir /opt/android-sdk && \
    cd /opt/android-sdk && \
    wget -q -O command.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip command.zip>> /dev/null 2>&1 && \
    rm command.zip && \
    yes | sdkmanager --licenses 1> /dev/null && \
    yes | sdkmanager --update && \
    yes | sdkmanager "platform-tools" \
                     "platforms;android-29" \
                     "build-tools;29.0.3" 1> /dev/null

CMD ["bash"]
