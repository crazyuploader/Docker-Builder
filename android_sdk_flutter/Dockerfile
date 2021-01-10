#
# Created by Jugal Kishore --- 2020
#
# Android SDK with Flutter
#
# Base Image: crazyuploader/android_sdk
FROM crazyuploader/android_sdk:latest

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Environment Variables
ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin

# Getting Flutter stable from GitHub source https://github.com/flutter/flutter.git
RUN git clone --depth=1 https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME} && \
    flutter doctor

CMD ["bash"]
