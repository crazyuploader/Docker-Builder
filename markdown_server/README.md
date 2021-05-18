# Markdown Server

> A NodeJS based Markdown Server

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/crazyuploader/markdown_server/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/crazyuploader/markdown_server)

## Usage

We need to mount our markdown directory to `/markdown` in the container.
For example to serve current directory with [Markserve](https://github.com/markserv/markserv) -

```bash
docker run -v "${PWD}:/markdown" -p 8080:80 crazyuploader/markdown_server:latest
```
