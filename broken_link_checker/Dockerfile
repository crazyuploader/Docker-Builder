#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
#
# Base Image: node:lts-alpine3.21
FROM node:lts-alpine3.21

# Install Broken Link Checker
RUN npm install --location=global broken-link-checker@0.7.8

# Entrypoint for Broken Link Checker
ENTRYPOINT [ "blc" ]
