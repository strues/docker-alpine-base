TAG ?= 1.0
newtag ?= latest
image = strues/alpine-base

build:
	docker build --no-cache=true -t "${image}:latest" .
	docker tag "${image}:latest" "${image}:$(TAG)"
