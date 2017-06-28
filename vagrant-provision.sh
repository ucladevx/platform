#! /bin/bash

echo "Running provision script..."

# DO NOT update grub. this is unnecessary and causes the provision to hang
apt-mark hold grub-pc

# update and upgrade VM packages
apt-get update
apt-get -y upgrade

# install dev tools
apt-get -y install emacs vim gcc g++ build-essential git make curl \
           git-core zlib1g-dev libssl-dev libreadline-dev libyaml-dev \ 
           libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libffi-dev \
           libcurl4-openssl-dev python-software-properties python \ 
           python-dev python-pip python-yaml nodejs
pip install --upgrade pip
pip install --upgrade virtualenv

# install ruby and rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io -o /tmp/rvm.sh
cat /tmp/rvm.sh | bash -s stable --rails
echo "source /home/vagrant/.rvm/scripts/rvm" >> /home/vagrant/.bashrc

# install glide (for package management), but not go runtime
curl https://glide.sh/get | sh

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

# start docker on boot
systemctl enable docker

# install docker-compose for complex docker setups
curl -fsSL https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# cleanup
apt-get clean
apt-get autoremove
apt-get purge

echo "Setup complete!"