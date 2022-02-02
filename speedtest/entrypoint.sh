#!/usr/bin/env sh

# Accepting Ookla License
speedtest --accept-license --accept-gdpr "$@" 2> /dev/null
