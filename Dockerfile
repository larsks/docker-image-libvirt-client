FROM fedora:rawhide
MAINTAINER Lars Kellogg-Stedman <lars@redhat.com>

RUN yum -y install \
	virt-install \
	libvirt-client \
	; yum clean all

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Connect to a libvirt port on the host by default, using
# the address of the docker0 interface.
CMD ["/usr/bin/virsh"]

