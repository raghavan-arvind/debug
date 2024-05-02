REPO=raghavanarvind/debug
TAG=latest
PLATFORMS=linux/amd64,linux/arm64
DOCKERHUB_USER=raghavanarvind
DOCKERHUB_PASS=$(shell cat ~/.dockerhubpass)

build:
	docker buildx build --platform $(PLATFORMS) -t $(REPO):$(TAG) .

login:
	docker login -u $(DOCKERHUB_USER) -p $(DOCKERHUB_PASS)

push:
	docker buildx build --platform $(PLATFORMS) -t $(REPO):$(TAG) --push .

run: build
	docker run -it --rm $(REPO):$(TAG)
