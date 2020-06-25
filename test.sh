#!/usr/bin/env bash

git show --pretty="" --name-only 4dda5f4e2d9d584ad1a4c1f3f692633e75f41381 | grep "Dockerfile" >> to_build.txt
FILES=$(cat to_build.txt)
rm to_build.txt
for FILE in ${FILES}; do
    echo ""
    DIR=$(dirname "${FILE}")
    docker build -f "${FILE}" -t crazyuploader/"${DIR}":latest .
done
