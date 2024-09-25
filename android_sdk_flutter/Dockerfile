#
# Created by Jugal Kishore --- 2020
#
# Android SDK with Flutter
#
# Base Image: crazyuploader/android_sdk:latest
FROM crazyuploader/android_sdk:latest

# Setting Non-Interactive Build Time Environment Variable
ARG DEBIAN_FRONTEND=noninteractive

# Setting TERM Environment Variable
ENV TERM=xterm-256color

# Environment Variables
ENV FLUTTER_HOME=/opt/flutter
ENV PATH=${PATH}:${FLUTTER_HOME}/bin

# Getting Flutter stable from GitHub source https://github.com/flutter/flutter.git
RUN git clone --depth=1 https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME}

# Create a new non-root user
RUN useradd -m -s /bin/bash worker

# Change the ownership of the /opt/android-sdk & /opt/flutter directory
RUN chown -R worker:worker /opt/android-sdk && \
    chown -R worker:worker ${FLUTTER_HOME}

# Set the new user as the active user
USER worker

# Run flutter doctor command
RUN flutter doctor

CMD ["bash"]
