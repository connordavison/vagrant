#!/usr/bin/env bash
set -v
# +-----------------------------------+
# | Installing PHP 5.x and extensions |
# +-----------------------------------+
PHP_TIMEZONE="UTC"

add-apt-repository ppa:ondrej/php
apt-get -y update
apt-get install -y php5.6 php5.6-cli php5.6-curl php5.6-mcrypt php5.6-gd \
        php-pear php5.6-xdebug php5.6-intl php5.6-mysql php5.6-sqlite \
        php5.6-dom

# Tools
# Composer -  dependency management
wget -nv getcomposer.org/composer.phar
mv composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

# Update Composer home & PATH
echo 'export COMPOSER_HOME=~/.composer' >> ~/.bashrc
echo 'PATH=$PATH:./vendor/bin:~/.composer/vendor/bin' >> ~/.bashrc

# Psysh - PHP REPL
wget -nv psysh.org/psysh
mv psysh /usr/local/bin/psysh
chmod a+x /usr/local/bin/psysh
