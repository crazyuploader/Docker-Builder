#!/usr/bin/env bash

# Script to test Dockerfile changed in last commit

# Colors
GREEN="\033[1;32m"
NC="\033[0m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RED="\033[0;31m"

git show --pretty="" --name-only | grep "Dockerfile" >> to_build.txt
FILES=$(cat to_build.txt)
rm to_build.txt
echo -e "${GREEN} Available Dockerfile -${NC}"
find -- * -name "Dockerfile"
echo ""
echo -e "${YELLOW} Dockerfile changed -${NC}"
for f in ${FILES}; do
    echo -e "${MAGENTA}${f}${NC}"
done
ERROR_FILE=0
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
for FILE in ${FILES}; do
    echo ""
    echo -e "Building ---> ${YELLOW}${FILE}${NC}"
    echo ""
    DIR=$(dirname "${FILE}")
    BUILD_OUTPUT=$(docker build -f "${FILE}" -t crazyuploader/"${DIR}":latest .)
    EXIT_CODE="$?"
    if [[ "${EXIT_CODE}" != "0" ]]; then
        ((ERROR_FILE = ERROR_FILE + 1))
        echo ""
        echo -e "${RED}---E-R-R-O-R---${NC}"
        echo ""
        echo "${BUILD_OUTPUT}"
        echo ""
        echo -e "${RED}---E-R-R-O-R---${NC}"
        echo ""
    else
        echo ""
        echo "${BUILD_OUTPUT}"
    fi
done
if [[ "${ERROR_FILE}" != "0"  ]]; then
    exit 1
else
    exit 0
fi
