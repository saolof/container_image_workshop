#!/bin/sh
set -eux

mkdir lower upper workdir merged

tar -xzf bash-chroot-image.tar.gz --directory lower

sudo mount -t overlay overlay -o lowerdir=./lower,upperdir=./upper,workdir=./workdir ./merged

tar -xzf nano-chroot-image.tar.gz --directory merged

#sudo umount ./merged
#m -rf lower upper/ workdir/ merged
