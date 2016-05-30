#!/usr/bin/env bash
source /vagrant/bootstrap/common.sh

# +-------------------------------+
# | Installing essential packages |
# +-------------------------------+
apt-get -qq -y update
apt-get -qq install -y build-essential git-core curl python-software-properties \
        unzip

cp /vagrant/bootstrap/bash_aliases.sh /home/vagrant/.bash_aliases
