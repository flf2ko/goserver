PWD=$(shell pwd)
SOURCE=./src/...
export GOPATH = $(PWD)


build:
	CGO_ENABLED=0 GOOS=linux go install -ldflags="-w -s" -v $(SOURCE)
