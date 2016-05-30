#!/usr/bin/env bash
source /vagrant/bootstrap/common.sh

# +-----------------------------------+
# | Installing PHP 5.x and extensions |
# +-----------------------------------+
PHP_TIMEZONE="UTC"

add-apt-repository ppa:ondrej/php
apt-get -qq -y update
apt-get -qq install -y php5.6 php5.6-cli php5.6-curl php5.6-mcrypt php5.6-gd \
        php-pear php5.6-xdebug php5.6-intl php5.6-mysql php5.6-sqlite \
        php5.6-dom php5.6-mbstring

# Configure PHP
sed -i "s/;date.timezone =/date.timezone = Europe\/London/" /etc/php/5.6/apache2/php.ini
sed -i "s/;date.timezone =/date.timezone = Europe\/London/" /etc/php/5.6/cli/php.ini

# Tools
# Composer - dependency management
wget -nv getcomposer.org/composer.phar
mv composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

# Composer - proc_open() patch
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1

# Update Composer home & PATH
echo 'export COMPOSER_HOME=~/.composer' >> ~/.bashrc
echo 'PATH=$PATH:./vendor/bin:~/.composer/vendor/bin' >> ~/.bashrc

# Psysh - PHP REPL
wget -nv psysh.org/psysh
mv psysh /usr/local/bin/psysh
chmod a+x /usr/local/bin/psysh
