#!/usr/bin/env bash

git show --pretty="" --name-only 5b272c4a3c1ee41c58beea3041f5b664fcf3308c | grep "Dockerfile" >> to_build.txt
FILES=$(cat to_build.txt)
rm to_build.txt
for FILE in ${FILES}; do
    echo ""
    DIR=$(dirname "${FILE}")
    docker build -f "${FILE}" -t crazyuploader/"${DIR}":latest .
done
