#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
#
# Using Node JS LTS Alpine as base
FROM node:lts-alpine3.15

# Install Broken Link Checker
RUN npm install --location=global broken-link-checker

# Entrypoint for Broken Link Checker
ENTRYPOINT [ "blc" ]
