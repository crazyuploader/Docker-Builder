#
# Created by Jugal Kishore --- 2020
#
# Android SDK
#
# Base Image: ubuntu:noble
FROM ubuntu:noble

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Update Packages list
RUN apt-get update

# Upgrade Packages to latest
RUN apt-get upgrade --yes

# Install Packages
RUN apt-get install --yes --no-install-recommends \
                    git curl nano ca-certificates openjdk-21-jdk \
                    wget zip unzip gpg ftp tar xz-utils \
                    tmux screen jq tree btop openssh-client 1> /dev/null

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Download Gradle
RUN mkdir /opt/gradle && \
    curl -sLo gradle.zip https://services.gradle.org/distributions/gradle-8.10-all.zip && \
    unzip -d /opt/gradle gradle.zip 1> /dev/null && \
    rm gradle.zip

# Download Kotlin
ARG KOTLIN_VERSION=2.0.20
RUN cd /opt && \
    curl -sLo kotlin.zip https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip && \
    unzip kotlin.zip && \
    rm kotlin.zip

# Environment Variables
ENV ANDROID_HOME /opt/android-sdk
ENV GRADLE_HOME /opt/gradle/gradle-8.10
ENV KOTLIN_HOME /opt/kotlinc
ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${KOTLIN_HOME}/bin

# Download Android SDK
RUN mkdir -p /opt/android-sdk/cmdline-tools && \
    cd /opt/android-sdk/cmdline-tools && \
    curl -sLo cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip cmdline-tools.zip >> /dev/null 2>&1 && \
    rm cmdline-tools.zip && \
    mv cmdline-tools latest

# Install Android SDK & Platform Tools
RUN yes | sdkmanager --licenses 1> /dev/null && \
    yes | sdkmanager --update && \
    yes | sdkmanager "platform-tools" \
                    "platforms;android-33" \
                    "platforms;android-34" \
                    "build-tools;33.0.3" \
                    "build-tools;34.0.0" 1> /dev/null

# Version Check
RUN java --version && \
    kotlin -version && \
    gradle --version && \
    echo "SDK Manager Version: $(sdkmanager --version)"

# Git Identity Setup
RUN curl -sLO https://raw.githubusercontent.com/crazyuploader/Bash/master/git_identity.sh && \
    printf "\nalias setgit=\"bash /git_identity.sh\"" >> ~/.bashrc

CMD ["bash"]
