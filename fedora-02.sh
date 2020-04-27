#!/bin/bash
set -e

# install the good stuff
dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo
dnf install docker-ce docker-compose
systemctl enable --now docker
groupadd docker
usermod -aG docker wallaby

