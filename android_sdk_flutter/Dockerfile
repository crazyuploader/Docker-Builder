#
# Created by Jugal Kishore --- 2020
#
# Android SDK with Flutter
#
# Base Image: Ubuntu
FROM crazyuploader/android_sdk:latest

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Environment Variables
ENV ANDROID_HOME /opt/android-sdk
ENV GRADLE_HOME /opt/gradle/gradle-6.4.1
ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${FLUTTER_HOME}/bin

# Getting Flutter stable from GitHub source https://github.com/flutter/flutter.git
RUN git clone --depth=1 https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME} && \
    flutter doctor

CMD ["bash"]
