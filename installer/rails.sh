#! /bin/bash

echo "Installing ruby and rails"

echo -e "\033[0;32m ==> Installing dependency: node.js \033[0m"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get -y install nodejs

node -v
npm -v

echo -e "\033[0;32m ==> Installing apt dependencies \033[0m"
sudo apt-get update
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs
sudo apt-get -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

echo -e "\033[0;32m ==> Downloading RVM \033[0m"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
echo "source ~/.rvm/scripts/rvm" >> $HOME/.bashrc
source ~/.rvm/scripts/rvm

echo -e "\033[0;32m ==> Installing Ruby \033[0m"
rvm install 2.4.1
rvm use 2.4.1 --default

echo -e "\033[0;32m ==> Installing Bundler \033[0m"
gem install bundler

echo -e "\033[0;32m ==> Installing Rails \033[0m"
gem install rails -v 5.1.1

ruby -v
rails -v

echo -e "\033[0;32m ==> Setting up base app \033[0m"
rails new rails_app
cp -rv base/rails/* rails_app/

echo -e "\033[0;32m ==> Installation complete! \033[0m"
echo -e "\033[0;31m ==> IMPORTANT! To use a DB with rails in docker, see \033[0m https://docs.docker.com/compose/rails/#connect-the-database"
echo -e "\033[0;31m ==> IMPORTANT! The command you should use is \033[0m 'docker-compose run web_rails rake db:create'"
