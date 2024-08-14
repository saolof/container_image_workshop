#!/bin/sh
set -eux

tar -xzf bash-chroot-image.tar.gz
sudo chroot bash-chroot
