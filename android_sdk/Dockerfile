#
# Created by Jugal Kishore --- 2020
#
# Android SDK
#
# Base Image: Ubuntu
FROM ubuntu:focal

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Update Packages list
RUN apt-get update

# Upgrade Packages to latest
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install -y --no-install-recommends \
                    git curl nano ca-certificates openjdk-8-jdk \
                    wget zip unzip gpg gpg-agent ftp ssh tar xz-utils \
                    tmux screen jq 1> /dev/null

# Install tmate
RUN curl https://raw.githubusercontent.com/crazyuploader/Bash/master/install/tmate.sh | bash -

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Download Gradle
RUN mkdir /opt/gradle && \
    curl -sLO https://services.gradle.org/distributions/gradle-6.8.1-all.zip && \
    unzip -d /opt/gradle gradle* 1> /dev/null && \
    rm gradle*.zip

# Download Kotlin
ARG KOTLIN_VERSION=1.4.10
RUN cd /opt && \
    curl -sLO https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip && \
    unzip ./*kotlin*.zip && \
    rm ./*kotlin*.zip

# Environment Variables
ENV ANDROID_HOME /opt/android-sdk
ENV GRADLE_HOME /opt/gradle/gradle-6.8.1
ENV KOTLIN_HOME /opt/kotlinc
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${KOTLIN_HOME}/bin

# Download Android SDK
RUN mkdir ~/.android && echo "### User Sources for Android SDK Manager" > ~/.android/repositories.cfg && \
    mkdir /opt/android-sdk && \
    cd /opt/android-sdk && \
    curl -sLo command.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip command.zip>> /dev/null 2>&1 && \
    rm command.zip && \
    yes | sdkmanager --licenses 1> /dev/null && \
    yes | sdkmanager --update && \
    yes | sdkmanager "platform-tools" \
                     "platforms;android-29" \
                     "platforms;android-30" \
                     "build-tools;30.0.0" \
                     "build-tools;29.0.3" 1> /dev/null

# Install ffsend
RUN curl -sL https://raw.githubusercontent.com/crazyuploader/Bash/master/install/ffsend.sh | bash -

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
