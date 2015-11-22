#!/bin/bash

sudo su

yum -y install cloud-init >/dev/null

mkdir -p /var/lib/cloud/seed/nocloud-net
mv /tmp/user-data /var/lib/cloud/seed/nocloud-net/
touch /var/lib/cloud/seed/nocloud-net/meta-data

cloud-init init
cloud-init modules --mode config
cloud-init modules --mode final
