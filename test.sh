#!/usr/bin/env bash

# Script to test Dockerfiles changed vs base branch

# Colors
GREEN="\033[1;32m"
NC="\033[0m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RED="\033[0;31m"

# Detect changed Dockerfiles across full branch range (not just last commit)
get_changed_dockerfiles() {
    local base_branch="${BASE_BRANCH:-main}"
    local fetch_err
    if ! fetch_err="$(git fetch origin "${base_branch}" --quiet 2>&1)"; then
        echo "WARNING: git fetch origin ${base_branch} failed: ${fetch_err}" >&2
    fi
    if ! git rev-parse --verify --quiet "origin/${base_branch}" >/dev/null; then
        echo "ERROR: ref origin/${base_branch} not found. Set BASE_BRANCH or fetch the remote." >&2
        exit 1
    fi
    git diff --name-only "origin/${base_branch}...HEAD" | grep '/Dockerfile$'
}

function build_dockerfile_amd64() {
    FILES="$(get_changed_dockerfiles)"
    echo -e "${GREEN}Available Dockerfiles:${NC}"
    find -- * -name "Dockerfile"
    echo ""
    if [[ -n ${FILES} ]]; then
        echo -e "${YELLOW}Changed Dockerfiles:${NC}"
        for f in ${FILES}; do
            echo -e "${MAGENTA}${f}${NC}"
        done
    else
        echo -e "${GREEN}No Dockerfiles changed, nothing to build.${NC}"
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
        docker build --progress=plain -f "${FILE}" -t crazyuploader/"${DIR}":latest .
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
    docker images
}

function build_dockerfile_arm64() {
    CHANGED_DIRS="$(get_changed_dockerfiles | sed 's|/Dockerfile$||')"
    if [[ -z "${CHANGED_DIRS}" ]]; then
        echo -e "${GREEN}No Dockerfiles changed, nothing to build.${NC}"
        exit 0
    fi
    while IFS= read -r directory; do
        [[ -z "${directory}" ]] && continue
        if echo "${CHANGED_DIRS}" | grep -qx "${directory}"; then
            echo ""
            echo -e "Building --> ${GREEN}${directory}/Dockerfile${NC}"
            echo ""
            docker build --progress=plain --file "${directory}"/Dockerfile --tag crazyuploader/"${directory}":arm64 .
        fi
    done < <(grep -v -E "\#|^$" arm64.list)
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
