#!/bin/bash
#Get the minimal alpine root filesystem
mkdir rootfs
cd rootfs
wget https://nl.alpinelinux.org/alpine/v3.6/releases/armhf/alpine-minirootfs-3.6.1-armhf.tar.gz
tar xvzf alpine-minirootfs-3.6.1-armhf.tar.gz
rm alpine-minirootfs-*.tar.gz
cd ..
