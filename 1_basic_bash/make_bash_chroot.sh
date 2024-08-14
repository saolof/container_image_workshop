#!/bin/sh
set -eux


mkdir -p bash-chroot
cd bash-chroot
mkdir -p bin lib lib64
cp /bin/bash bin
cp /bin/ls bin


cp	/lib/x86_64-linux-gnu/libtinfo.so.6 lib
cp	/lib/x86_64-linux-gnu/libc.so.6 lib
cp	/lib/x86_64-linux-gnu/libselinux.so.1 lib
cp	/lib/x86_64-linux-gnu/libpcre2-8.so.0 lib
cp	/lib64/ld-linux-x86-64.so.2 lib64
