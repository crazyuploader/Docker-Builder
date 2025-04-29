# Markdown Server

> A Golang based Markdown Server

[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/crazyuploader/markdown_server/latest)](https://hub.docker.com/r/crazyuploader/markdown_server)
[![Docker Pulls](https://img.shields.io/docker/pulls/crazyuploader/markdown_server)](https://hub.docker.com/r/crazyuploader/markdown_server)

## Usage

We need to mount our markdown directory to `/srv/algernon` in the container.
For example to serve current directory with [Algernon](https://github.com/xyproto/algernon) on port `8080` -

```bash
docker run -v "${PWD}:/markdown" -p 8080:3000 -p 35729:35729 crazyuploader/markdown_server:latest
```
