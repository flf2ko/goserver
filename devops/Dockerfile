FROM golang:1.19-alpine3.16 as builder
WORKDIR /go/src/

ARG VERSION

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go install -mod=vendor -ldflags="-w -s -X main.ver=$VERSION" -v ./...

FROM alpine:3.16.2
RUN apk --no-cache add ca-certificates
CMD ["./goserver"]
COPY --from=builder /go/bin/goserver .
