#!/usr/bin/env bash

# Script to get Speedtest CLI

set -eu
set -o pipefail

ARCH="$(arch)"

if [[ "$(arch)" == "x86_64" ]] || [[ "$(arch)" == "aarch64" ]]; then
    wget --quiet --output-document /tmp/speedtest.tar.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-"${ARCH}"-linux.tgz
fi
