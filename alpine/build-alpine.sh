#!/bin/Bash
#Get the minimal alpine root filesystem
mkdir rootfs
cd rootfs
wget https://nl.alpinelinux.org/alpine/v3.6/releases/armhf/alpine-minirootfs-3.6.1-armhf.tar.gz 
tar xvzf alpine-minirootfs-3.6.1-armhf.tar.gz
rm alpine-minirootfs-*.tar.gz
cd ..

# Begin build with specific rootfs
acbuild --debug begin ./rootfs
#acbuild --debug begin quay.io/coreos/alpine-sh:latest

# Set some meta data
acbuild --debug set-name alpine-armv7l
acbuild --debug label add version 0.0.1
acbuild --debug label add arch armv7l
acbuild --debug label add os linux

#acbuild --debug copy ./alpine-minirootfs /

# Update and add apps
acbuild --debug run -- apk update
acbuild --debug run -- apk add nginx
# Add a port for http traffic over port 80
acbuild --debug port add http tcp 80

# Add a mount point for files to serve
#acbuild --debug mount add html /usr/share/nginx/html

# Run nginx in the foreground
acbuild --debug set-exec -- /usr/sbin/nginx -g "daemon off;"

# Write the ACi to disk
acbuild --debug write --overwrite alpine-armv7l.aci

# End build
acbuild --debug end

# Clean up
rm -rf rootfs
