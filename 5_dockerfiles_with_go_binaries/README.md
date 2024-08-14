# Building small go images

Pure Go binaries are _statically linked_. If you do not use
a library that requires pieces written in C, it just works
even with a scratch image, no ldd requires.

Sometimes ldd is required (like requiring libc for net/http) and
then there are some good standard images to handle that. Which one
to pick? It depends.
