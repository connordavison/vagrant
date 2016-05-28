#!/usr/bin/env bash
set -v

export DEBIAN_FRONTEND=noninteractive

# +-------------------------------+
# | Installing essential packages |
# +-------------------------------+
apt-get -qq -y update
apt-get -qq install -y build-essential git-core curl python-software-properties \
        unzip

source /vagrant/bootstrap/node.sh
source /vagrant/bootstrap/php.sh
source /vagrant/bootstrap/mysql.sh
cp /vagrant/bootstrap/bash_aliases.sh ~/.bash_aliases
