#!/usr/bin/env bash

echo '+-------------------------+'
echo '| Obtaining configuration |'
echo '+-------------------------+'
source /vagrant/config.sh

echo '+-------------------------------+'
echo '| Installing essential packages |'
echo '+-------------------------------+'
apt-get -y update
apt-get install -y build-essential git-core curl python-software-properties

source /vagrant/bootstrap/php.sh
source /vagrant/bootstrap/mysql.sh
cp /vagrant/bootstrap/bash_aliases.sh ~/.bash_aliases
