#
# Created by Jugal Kishore --- 2020
#
# Android SDK with Flutter
#
# Base Image: crazyuploader/android_sdk
FROM crazyuploader/android_sdk:latest

# Setting Non-Interactive Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Environment Variables
ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:/opt/android-sdk/tools/bin:/opt/android-sdk/platform-tools:${FLUTTER_HOME}/bin

# Getting Flutter stable from GitHub source https://github.com/flutter/flutter.git
RUN git clone --depth=1 https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME} && \
    flutter doctor

CMD ["bash"]
