#!/bin/bash

set -x

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Install Hubot
npm install -g yo generator-hubot

# Setup Hubot scripts
mkdir $HOME/seccong && cd $HOME/seccong
yo hubot --adapter matteruser
