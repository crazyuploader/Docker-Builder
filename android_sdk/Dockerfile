#
# Created by Jugal Kishore --- 2020
#
# Android SDK
#
# Base Image: Ubuntu
FROM ubuntu:focal

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Update Packages list
RUN apt-get update

# Upgrade Packages to latest
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install -y --no-install-recommends \
                    git curl nano ca-certificates openjdk-8-jdk \
                    wget zip unzip gpg ftp ssh

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Download Gradle
RUN mkdir /opt/gradle && \
    wget -q https://services.gradle.org/distributions/gradle-6.4.1-all.zip && \
    unzip -d /opt/gradle gradle*>> /dev/null 2>&1 && \
    rm gradle*.zip

# Download Kotlin
RUN cd /opt && \
    wget -q https://github.com/JetBrains/kotlin/releases/download/v1.3.72/kotlin-compiler-1.3.72.zip && \
    unzip *kotlin*.zip && \
    rm *kotlin*.zip

# Environment Variables
ENV ANDROID_HOME /opt/android-sdk
ENV GRADLE_HOME /opt/gradle/gradle-6.4.1
ENV KOTLIN_HOME /opt/kotlinc
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${KOTLIN_HOME}/bin

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

# Git Identity Setup
RUN curl -sO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    echo "\nbash /git_identity.sh" >> ~/.bashrc

CMD ["bash"]
