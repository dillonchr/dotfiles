#!/bin/bash
set -e

# install the good stuff
dnf install -y dnf-plugins-core git tmux neovim zsh curl powerline-fonts tlp xclip

# get docker repo added
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-compose

docker run busybox:1.24 echo "docker is up and running"
docker-compose --version

usermod -aG docker wallaby
