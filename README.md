alpine-base
=============

Just another Alpine Linux base image. It's based in alpine 3.4, adding basic software bash openssl and curl.

## Build

```
docker build -t strues/alpine-base:<version> .
```


## Usage

To use this image include `FROM strues/alpine-base` at the top of your `Dockerfile`.
