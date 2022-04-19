APP=goserver
DOCKERTAG=flf2ko/$(APP)
REVISION=$(shell git rev-list -1 HEAD)
TAG=$(shell git tag -l --points-at HEAD)
ifeq ($(TAG),)
TAG=$(REVISION)
endif

modvendor:
	- rm go.sum
	GO111MODULE=on go mod tidy
	GO111MODULE=on go mod vendor

docker:
	docker build --build-arg VERSION=$(TAG) -t $(DOCKERTAG):$(TAG) -f devops/Dockerfile .
