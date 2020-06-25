#!/usr/bin/env bash

git show --pretty="" --name-only | grep "Dockerfile" >> to_build.txt
FILES=$(cat to_build.txt)
rm to_build.txt
for FILE in ${FILES}; do
    echo ""
    DIR=$(dirname "${FILE}")
    docker build -f "${FILE}" -t crazyuploader/"${DIR}":latest .
done
