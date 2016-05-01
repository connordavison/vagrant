#!/usr/bin/env bash
set -v

export DEBIAN_FRONTEND=noninteractive

# +-------------------------+
# | Obtaining configuration |
# +-------------------------+
source /vagrant/config.sh

# +-------------------------------+
# | Installing essential packages |
# +-------------------------------+
apt-get -y update
apt-get install -y build-essential git-core curl python-software-properties

source /vagrant/bootstrap/php.sh
source /vagrant/bootstrap/mysql.sh
cp /vagrant/bootstrap/bash_aliases.sh ~/.bash_aliases
