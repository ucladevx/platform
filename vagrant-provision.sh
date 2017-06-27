#! /bin/bash

echo "Running provision script..."

# DO NOT update grub. this is unnecessary and causes the provision to hang
apt-mark hold grub-pc
# update and upgrade VM packages
apt-get update
apt-get -y upgrade

# install essential dev tools
apt-get -y install emacs vim gcc g++ build-essential git make curl python python-yaml

# install docker requirements
apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install apt-transport-https ca-certificates software-properties-common

# add docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /tmp/docker.gpg
apt-key add /tmp/docker.gpg

# add docker repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update

# install docker
apt-get -y install docker-ce

# to make it not a pain to use docker, add user vagrant into docker group
groupadd docker
usermod -aG docker $USER

# start docker on boot
systemctl enable docker

# install docker-compose for complex docker setups
curl -fsSL https://github.com/docker/compose/releases/download/1.14/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Setup complete!"