PWD=$(shell pwd)
SOURCE=./src/...
export GOPATH = $(PWD)

build:
	go install -v $(SOURCE)

cross-compile:
	CGO_ENABLED=0 GOOS=linux go install -ldflags="-w -s" -v $(SOURCE)
