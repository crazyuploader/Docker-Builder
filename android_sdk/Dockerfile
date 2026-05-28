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
RUN GRADLE_VERSION="$(curl -fsSL --retry 3 https://services.gradle.org/versions/current | jq -er '.version')" && \
    mkdir /opt/gradle && \
    curl -fsSLo --retry 3 gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip" && \
    unzip -d /opt/gradle gradle.zip 1> /dev/null && \
    rm gradle.zip && \
    ln -s "/opt/gradle/gradle-${GRADLE_VERSION}" /opt/gradle/latest

# Install Kotlin
RUN KOTLIN_VERSION="$(curl -fsSL --retry 3 https://api.github.com/repos/JetBrains/kotlin/releases/latest | jq -er '.tag_name' | sed 's/^v//')" && \
    cd /opt && \
    curl -fsSLo --retry 3 kotlin.zip "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    unzip kotlin.zip && \
    rm kotlin.zip

# Environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV GRADLE_HOME=/opt/gradle/latest
ENV KOTLIN_HOME=/opt/kotlinc
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${KOTLIN_HOME}/bin

# Install Android SDK command-line tools
RUN CMDLINE_BUILD="$(curl -fsSL --retry 3 'https://developer.android.com/studio' | grep -oE 'commandlinetools-linux-[0-9]+_latest\.zip' | head -1 | grep -oE '[0-9]+')" && \
    mkdir -p /opt/android-sdk/cmdline-tools && \
    cd /opt/android-sdk/cmdline-tools && \
    curl -fsSLo --retry 3 cmdline-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_BUILD}_latest.zip" && \
    unzip cmdline-tools.zip 1> /dev/null && \
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

# Install sendme
RUN ARCH="$(uname -m)" && \
    case "$ARCH" in \
        x86_64)  TARGET="linux-x86_64" ;; \
        aarch64) TARGET="linux-aarch64" ;; \
        *) echo "Unsupported: $ARCH" && exit 1 ;; \
    esac && \
    URL="$(curl -fsSL --retry 3 https://api.github.com/repos/n0-computer/sendme/releases/latest | jq -er --arg t "$TARGET" '[.assets[] | select(.name | contains($t)) | select(.name | endswith(".tar.gz")) | .browser_download_url] | .[0]')" && \
    curl -fsSL "$URL" | tar xzf - -C /usr/local/bin

CMD ["bash"]
