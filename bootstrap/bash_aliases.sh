#!/usr/bin/env bash
alias ..='cd ..'
alias ...='cd ../..'

alias h='cd ~/'

alias c='composer'
alias artisan='php artisan'

alias m='mysql -uroot'

function xdebug {
    if [ "$1" == "off" ]; then
        sudo phpdismod xdebug
    else
        sudo phpenmod xdebug
    fi
}
