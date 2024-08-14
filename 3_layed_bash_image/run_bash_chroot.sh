#!/bin/sh
set -eux

tar -xzf bash-chroot-image.tar.gz
tar -xzf nano-chroot-image.tar.gz
sudo chroot bash-chroot
