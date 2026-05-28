#
# Created by Jugal Kishore --- 2020
#
# Android SDK
FROM ubuntu:resolute

# Non-interactive build
ARG DEBIAN_FRONTEND=noninteractive

# Terminal type
ENV TERM=xterm-256color

# Update packages
RUN apt-get update

# Upgrade packages
RUN apt-get upgrade --yes

# Install packages
RUN apt-get install --yes --no-install-recommends \
    git curl nano ca-certificates openjdk-25-jdk \
    wget zip unzip gpg ftp tar xz-utils \
    tmux screen jq tree btop openssh-client 1> /dev/null

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install Gradle
RUN GRADLE_VERSION="$(curl -s https://services.gradle.org/versions/current | jq -r '.version')" && \
    mkdir /opt/gradle && \
    curl -sLo gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip" && \
    unzip -d /opt/gradle gradle.zip 1> /dev/null && \
    rm gradle.zip && \
    ln -s "/opt/gradle/gradle-${GRADLE_VERSION}" /opt/gradle/latest

# Install Kotlin
RUN KOTLIN_VERSION="$(curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest | jq -r '.tag_name' | sed 's/^v//')" && \
    cd /opt && \
    curl -sLo kotlin.zip "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    unzip kotlin.zip && \
    rm kotlin.zip

# Environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV GRADLE_HOME=/opt/gradle/latest
ENV KOTLIN_HOME=/opt/kotlinc
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${KOTLIN_HOME}/bin

# Install Android SDK command-line tools
RUN CMDLINE_BUILD="$(curl -s 'https://developer.android.com/studio' | grep -oE 'commandlinetools-linux-[0-9]+_latest\.zip' | head -1 | grep -oE '[0-9]+')" && \
    mkdir -p /opt/android-sdk/cmdline-tools && \
    cd /opt/android-sdk/cmdline-tools && \
    curl -sLo cmdline-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_BUILD}_latest.zip" && \
    unzip cmdline-tools.zip >> /dev/null 2>&1 && \
    rm cmdline-tools.zip && \
    mv cmdline-tools latest

# SDK package versions
ARG ANDROID_PLATFORM=36
ARG BUILD_TOOLS_VERSION=36.0.0

# Install Android SDK packages
RUN yes | sdkmanager --licenses 1> /dev/null && \
    yes | sdkmanager --update && \
    yes | sdkmanager "platform-tools" \
                    "platforms;android-${ANDROID_PLATFORM}" \
                    "build-tools;${BUILD_TOOLS_VERSION}"

# Verify installs
RUN java --version && \
    kotlin -version && \
    gradle --version && \
    echo "SDK Manager Version: $(sdkmanager --version)"

CMD ["bash"]
