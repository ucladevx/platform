#! /bin/bash

echo -e "\033[0;32m ==> Installing node.js v6.x \033[0m"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get -y install nodejs

node -v
npm -v

echo -e "\033[0;32m ==> Setting up base app \033[0m"
mkdir node_app
cp -rv base/node/* node_app/

echo -e "\033[0;32m ==> Installation complete! \033[0m"