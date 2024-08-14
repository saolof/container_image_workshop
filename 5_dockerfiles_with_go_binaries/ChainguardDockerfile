FROM cgr.dev/chainguard/go AS builder
COPY . /app
RUN cd /app && go build -o go-hw .

FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=builder /app/go-hw /usr/bin/
CMD ["/usr/bin/go-hw"]

