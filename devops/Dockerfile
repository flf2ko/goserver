FROM golang:1.18-alpine3.15 as builder
WORKDIR /go/src/

ARG VERSION

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go install -mod=vendor -ldflags="-w -s -X main.ver=$VERSION" -v ./...

FROM alpine:3.15
RUN apk --no-cache add ca-certificates
CMD ["./goserver"]
COPY --from=builder /go/bin/goserver .
