PWD=$(shell pwd)
SOURCE=./src/...
export GOPATH = $(PWD)

build:
	go install -v $(SOURCE)
