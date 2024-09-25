#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
#
# Base Image: node:lts-alpine3.20
FROM node:lts-alpine3.20

# Install Broken Link Checker
RUN npm install --location=global broken-link-checker

# Entrypoint for Broken Link Checker
ENTRYPOINT [ "blc" ]
