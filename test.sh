#!/usr/bin/env bash

# Script to test Dockerfile changed in last commit

# Colors
GREEN="\033[1;32m"
NC="\033[0m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RED="\033[0;31m"

function build_dockerfile_amd64() {
    git show --pretty="" --name-only | grep "Dockerfile" >> to_build.txt
    FILES=$(cat to_build.txt)
    rm to_build.txt
    echo -e "${GREEN} Available Dockerfile -${NC}"
    find -- * -name "Dockerfile"
    echo ""
    if [[ -n ${FILES} ]]; then
        echo -e "${YELLOW} Dockerfile changed -${NC}"
        for f in ${FILES}; do
            echo -e "${MAGENTA}${f}${NC}"
        done
    else
        echo -e "${GREEN}No Dockerfile(s) have been changed in this commit, nothing to build.${NC}"
        echo "Exiting..."
        exit 0
    fi
    echo ""
    echo "Checking Docker..."
    IF_DOCKER=$(command -v docker)
    if [[ -z "${IF_DOCKER}" ]]; then
        echo ""
        echo -e "${RED}Docker not installed, can't continue.${NC}"
        echo "Exiting..."
        exit 1
    else
        echo ""
        echo "Docker installed, good to go!"
    fi
    NFILES=0
    ERROR_FILES=0
    for FILE in ${FILES}; do
        echo ""
        echo -e "Building ---> ${YELLOW}${FILE}${NC}"
        echo ""
        DIR=$(dirname "${FILE}")
        docker build -f "${FILE}" -t crazyuploader/"${DIR}":latest .
        ERROR_CODE="$?"
        (( NFILES = NFILES + 1 ))
        if [[ "${ERROR_CODE}" -ne "0" ]]; then
            (( ERROR_FILES = ERROR_FILES + 1 ))
        fi
    done
    if [[ "${ERROR_FILES}" -ne "0" ]]; then
        echo ""
        echo -e "Number of Dockerfile(s) built: ${RED}${NFILES}${NC}"
        exit 1
    else
        echo ""
        echo -e "Number of Dockerfile(s) built: ${GREEN}${NFILES}${NC}"
    fi
}

function build_dockerfile_arm64() {
    files="$(grep -v -E "\#|^$" arm64.list)"
    for directory in ${files}; do
        echo ""
        echo "Building --> ${GREEN}${directory}/Dockerfile${NC}"
        echo ""
        docker build --file "${directory}"/Dockerfile --tag crazyuploader/"${directory}":arm64 .
    done
    docker images
}

ARCH="$(arch)"

case "$ARCH" in

    "x86_64")
        build_dockerfile_amd64
        ;;

    "aarch64")
        build_dockerfile_arm64
        ;;

esac
