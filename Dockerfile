FROM golang:1.10.2

WORKDIR /go/src/app

RUN go get github.com/golang/dep/cmd/dep
COPY Gopkg.toml Gopkg.lock ./
RUN dep ensure -v -vendor-only

COPY src src
RUN CGO_ENABLED=0 GOOS=linux go install -ldflags="-w -s" -v ./...

FROM alpine:3.7
RUN apk --no-cache add ca-certificates
COPY --from=0 bin/ bin/

CMD ["./server"]
