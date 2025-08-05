REPO=raghavanarvind/debug
TAG=latest
PLATFORMS=linux/amd64,linux/arm64
DOCKERHUB_USER=raghavanarvind
DOCKERHUB_PASS=$(shell cat ~/.dockerhubpass)

.PHONY: build
build:
	docker buildx build --platform $(PLATFORMS) -t $(REPO):$(TAG) .

.PHONY: login
login:
	docker login -u $(DOCKERHUB_USER) -p $(DOCKERHUB_PASS)

.PHONY: push
push:
	docker buildx build --platform $(PLATFORMS) -t $(REPO):$(TAG) --push .

.PHONY: run
run: build
	docker run -it --rm $(REPO):$(TAG)
