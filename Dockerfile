FROM ubuntu:bionic

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl git python bc tar make wget gcc clang libssl-dev zip
RUN apt-get -y autoremove
