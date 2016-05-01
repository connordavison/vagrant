#!/usr/bin/env bash

echo '+------------------+'
echo '| Installing MySQL |'
echo '+------------------+'
debconf-set-selections <<< 'mysql-server mysql-server/root_password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password'
apt-get -y update
apt-get install -y mysql-server

echo '+-------------------------------------+'
echo '| Configuring MySQL user and database |'
echo '+-------------------------------------+'
if [ "$DATABASE_NAME" != "" ]; then
    echo "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME}" | mysql -uroot
fi

# Edit my.cnf to unbind localhost
if [ "$DATABASE_ROOT_HOST" != "localhost" ]; then
    sed "s/bind-address\([[:space:]]*\)=\([[:space:]]*\)127.0.0.1/bind-address\1=\20.0.0.0/g" /etc/mysql/my.cnf \
            > /etc/mysql/my.cnf.tmp
    mv /etc/mysql/my.cnf.tmp /etc/mysql/my.cnf

    echo "use mysql; UPDATE user SET Host = '%' WHERE User = 'root' AND Host = '::1'" | mysql -u root
    service mysql restart
fi
