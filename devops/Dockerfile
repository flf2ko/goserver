FROM golang:1.11.1-alpine3.7 as builder
WORKDIR /go/src/
ENV GO111MODULE=on
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go install -mod=vendor -ldflags="-w -s" -v ./...

FROM alpine:3.7
RUN apk --no-cache add ca-certificates
CMD ["./goserver"]
COPY --from=builder /go/bin/goserver .
