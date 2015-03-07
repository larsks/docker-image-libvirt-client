#!/bin/sh

# Set LIBVIRT_DEFAULT_URI to point at the docker0 interface if it
# is not otherwise set.  This allows this image to work
# "out of the box" on a system running the libvirtd container with
# --net=host.
if ! [ "$LIBVIRT_DEFAULT_URI" ]; then
	defaultgw=$(ip route list | awk '/default/ {print $3}')
	LIBVIRT_DEFAULT_URI="qemu+tcp://${defaultgw}/system"
	export LIBVIRT_DEFAULT_URI
fi

exec "$@"

