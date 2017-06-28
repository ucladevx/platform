#! /bin/bash

echo -e "\033[0;32m ==> Installing golang v1.8.3 \033[0m"
curl -fsSL https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz -o /tmp/go.tar.gz
tar -xf /tmp/go.tar.gz
mv go /usr/local

echo -e "\033[0;32m ==> Installing glide \033[0m"
curl https://glide.sh/get | sh
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.bashrc

go -v
glide -v

echo -e "\033[0;32m ==> Setting up base app \033[0m"
mkdir golang_app
cp -rv base/golang/* golang_app/

echo -e "\033[0;32m ==> Installation complete! \033[0m"