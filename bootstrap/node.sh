#!/usr/bin/env bash
set -v
# +-----------------------------+
# | Installing NVM, Node, & NPM |
# +-----------------------------+
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
exec bash

nvm install node
