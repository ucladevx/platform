#! /bin/bash

echo -e "\033[0;32m ==> Installing python tools \033[0m"
sudo apt-get -y install python python3 python-dev python-pip

echo -e "\033[0;32m ==> Setting up base app \033[0m"
mkdir python_app
cp -rv base/python/* python_app/

echo -e "\033[0;32m ==> Installation complete! \033[0m"
