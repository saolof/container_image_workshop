# Building small go images with go install:


Let's build a pgbouncer_exporter image. We can go install it in a
golang:latest build image.

Running ldd on the binary, it does actually need a libc
and access to some linux API libraries for networking:

```
root@28924ace10bf:/go/bin# ldd pgbouncer_exporter 
	linux-vdso.so.1 (0x00007ffc72870000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x0000732801f46000)
	/lib64/ld-linux-x86-64.so.2 (0x000073280212c000)

```

We can copy them into the appropriate directories ourselves, but we can save
ourselves a bit of work and use a distroless image from chainguard instead
of building from scratch. It includes very common shared libraries,
and also some TLS certificates to make your life easier.


Unlike busybox, it does not include a shell. This implies a contract between
the image builder and the ops team that it should not need a shell to debug,
not exposing a shell communicates this to the person debugging the container.
In this case it should be configured via env variables, log to stdout only, etc etc.
