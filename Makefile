APP=goserver
DOCKERTAG=flf2ko/$(APP)

modvendor:
	- rm go.sum
	GO111MODULE=on go mod tidy
	GO111MODULE=on go mod vendor

docker:
	docker build -t $(DOCKERTAG) -f devops/Dockerfile .
