#!/bin/sh
set -e -x

# Get needed software
apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common

# Fetch puppet configuration from public git repository.
mv /etc/puppet /etc/puppet.orig
git clone https://github.com/5orenso/ec2-puppet-cloudinit-mongodb.git /etc/puppet

# Run puppet.
export FACTER_gitconfigrepo="https://<username>:<password>@github.com/<username>/<config repo>.git"

puppet apply /etc/puppet/manifests/mainrun.pp
