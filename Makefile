PWD=$(shell pwd)
SOURCE=./...
export GOPATH = $(PWD)

build:
	dep ensure -v -vendore-only
	go install -v $(SOURCE)

cross-compile:
	dep ensure -v -vendore-only
	CGO_ENABLED=0 GOOS=linux go install -ldflags="-w -s" -v $(SOURCE)
