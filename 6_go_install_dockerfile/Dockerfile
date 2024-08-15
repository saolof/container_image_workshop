FROM golang:latest AS builder
RUN go install github.com/prometheus-community/pgbouncer_exporter@v0.9.0

FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=builder /go/bin/pgbouncer_exporter /usr/local/bin/pgbouncer_exporter
CMD ["/usr/local/bin/pgbouncer_exporter"]

