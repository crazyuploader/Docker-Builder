#
# Created by Jugal Kishore -- 2021
#
# A NodeJS based Markdown Server
#
# Using node:current-alpine as Base Image
FROM node:current-alpine

# Add Markserve
RUN npm install --global markserv@1.17.4

# Creating a Directory for Markserv
RUN mkdir /markdown

# Exposing port 80
EXPOSE 80

CMD ["markserv", "-p", "80", "-a", "0.0.0.0", "/markdown"]
