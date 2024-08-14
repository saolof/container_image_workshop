#!/bin/sh
set -eux


mkdir -p bash-chroot
cd bash-chroot
mkdir -p bin lib lib64

cp	/lib/x86_64-linux-gnu/libtinfo.so.6 lib
cp	/lib/x86_64-linux-gnu/libc.so.6 lib
cp	/lib/x86_64-linux-gnu/libselinux.so.1 lib
cp	/lib/x86_64-linux-gnu/libpcre2-8.so.0 lib
cp	/lib64/ld-linux-x86-64.so.2 lib64


cp /bin/bash bin
cp /bin/ls bin

# Tar first image layer
cd ..
tar -czf bash-chroot-image.tar.gz bash-chroot
rm -rf bash-chroot


# Let's make a second image intended to be extracted on the top one!

mkdir -p bash-chroot
cd bash-chroot
mkdir -p bin lib lib64

cp /lib/x86_64-linux-gnu/libtinfo.so.6 lib
cp /bin/pwd bin
cp /bin/touch bin
cp /bin/less bin
cp /bin/cat bin

# tar second layer
cd ..
tar -czf nano-chroot-image.tar.gz bash-chroot
rm -rf bash-chroot
