FROM golang:latest AS builder
COPY . /app
RUN cd /app && go build -o go-hw .

FROM busybox:glibc
#FROM cgr.dev/chainguard/glibc-dynamic
#FROM scratch
COPY --from=builder /app/go-hw /usr/bin/
CMD ["/usr/bin/go-hw"]

