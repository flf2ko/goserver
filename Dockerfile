FROM golang:1.10.2-alpine3.7

WORKDIR /go/src/app
COPY ./bin .

CMD ["./bin/server"]
