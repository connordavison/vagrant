#!/usr/bin/env bash
set -v
# +----------------+
# | Installing NVM |
# +----------------+
export NVM_DIR="/home/vagrant/.nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
echo "source ~/.nvm/nvm.sh" >> /home/vagrant/.bashrc
chown -R vagrant:vagrant /home/vagrant/.nvm
