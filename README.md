# Docker-Builder

## Introduction

The Docker Builder repository contains Dockerfiles for various tools and environments...

## CI/CD Badges

[![CircleCI](https://circleci.com/gh/crazyuploader/Docker-Builder/tree/master.svg?style=svg)](https://circleci.com/gh/crazyuploader/Docker-Builder/tree/master)
[![Build Status](https://crazyuploader.semaphoreci.com/badges/Docker-Builder.svg)](https://crazyuploader.semaphoreci.com/projects/Docker-Builder)
[![Cirrus CI](https://img.shields.io/cirrus/github/crazyuploader/Docker-Builder/master?label=Cirrus%20CI)](https://cirrus-ci.com/github/crazyuploader/Docker-Builder)
[![Docker Image CI](https://github.com/crazyuploader/Docker-Builder/actions/workflows/dockerimage.yml/badge.svg)](https://github.com/crazyuploader/Docker-Builder/actions/workflows/dockerimage.yml)

[![CodeFactor](https://www.codefactor.io/repository/github/crazyuploader/docker-builder/badge/master)](https://www.codefactor.io/repository/github/crazyuploader/docker-builder/overview/master)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/17fa9f267ca748ca841ab338644d2086)](https://www.codacy.com/gh/crazyuploader/Docker-Builder/dashboard?utm_source=github.com&utm_medium=referral&utm_content=crazyuploader/Docker-Builder&utm_campaign=Badge_Grade)

## Availabe Image(s)

### DockerHub

- [`Alpine`](alpine/Dockerfile)
- [`Android SDK`](android_sdk/Dockerfile)
- [`Android SDK with Flutter`](android_sdk_flutter/Dockerfile)
- [`Broken Link Checker`](broken_link_checker/Dockerfile)
- [`C++ Build Tools`](cpp_build_tools/Dockerfile)
- [`Golang`](golang/Dockerfile)
- [`Hugo Site Generator`](hugo/Dockerfile)
- [`Java Build Tools`](java_build_tools/Dockerfile)
- [`Kernel Builder`](kernel_build/Dockerfile)
- [`Markdown Server`](markdown_server/Dockerfile)
- [`Minimal Ubuntu`](minimal_ubuntu/Dockerfile)
- [`NodeJS Build Tools`](node_build_tools/Dockerfile)
- [`Python Build Tools`](python_build_tools/Dockerfile)
- [`Speedtest`](speedtest/Dockerfile)

### GitHub Container Registry

- [`Alpine`](alpine/Dockerfile)
- [`Broken Link Checker`](broken_link_checker/Dockerfile)
- [`Hugo`](hugo/Dockerfile)
- [`Golang`](golang/Dockerfile)
- [`Markdown Server`](markdown_server/Dockerfile)
- [`Minimal Ubuntu`](minimal_ubuntu/Dockerfile)
- [`Networking`](networking/Dockerfile)
- [`NodeJS Build Tools`](node_build_tools/Dockerfile)
- [`Python Build Tools`](python_build_tools/Dockerfile)
- [`Speedtest`](speedtest/Dockerfile)

## Usage

You can pull and run any of the images using:

```bash
docker pull crazyuploader/<image-name>
docker run -it crazyuploader/<image-name>
```

**DockerHub Profile: [crazyuploader](https://hub.docker.com/u/crazyuploader)**
