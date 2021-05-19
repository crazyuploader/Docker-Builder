#
# Created by Jugal Kishore -- 2021
#
# A NodeJS based Markdown Server
#
# Using node:current-alpine as Base Image
FROM node:current-alpine

# Markserv Version
ARG MARKSERV_VERSION=1.17.4

# Add Markserve
RUN npm install --global markserv@"${MARKSERV_VERSION}"

# Creating a Directory for Markserv
RUN mkdir /markdown

# Exposing port(s)
EXPOSE 80 35729

CMD ["markserv", "-p", "80", "-a", "0.0.0.0", "/markdown"]
