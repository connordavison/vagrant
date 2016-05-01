#!/usr/bin/env bash

echo '+-----------------------------------+'
echo '| Installing PHP 5.x and extensions |'
echo '+-----------------------------------+'
add-apt-repository ppa:ondrej/php5
apt-get -y update
apt-get install -y php5-cli php5-curl php5-mcrypt php5-gd php-pear php5-xdebug \
        php5-intl php5-mysql

# Tools
wget -nv getcomposer.org/composer.phar
mv composer.phar /usr/local/bin/composer

wget -nv psysh.org/psysh
mv psysh /usr/local/bin/psysh

chmod a+x /usr/local/bin/composer /usr/local/bin/psysh

# Update Composer home & PATH
echo 'export COMPOSER_HOME=~/.composer' >> ~/.bashrc
echo 'PATH=$PATH:./vendor/bin:~/.composer/vendor/bin' >> ~/.bashrc
