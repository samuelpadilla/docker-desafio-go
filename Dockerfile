FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY main.go .

RUN go mod init

RUN go build -o /go/bin/hello

FROM scratch

COPY --from=builder /go/bin/hello /hello

CMD ["/hello"]

#docker build -t sampad/go . -f Dockerfile
#docker run -d --name go sampad/go
#docker run -tid sampad/go