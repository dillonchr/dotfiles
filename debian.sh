
#!/bin/bash
set -e

# install the good stuff
sudo apt install -y git tmux neovim zsh curl powerline-fonts tlp xclip jq
curl -sSL https://get.docker.com | sh

sudo systemctl enable docker
sudo systemctl start docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

systemctl enable --now docker
groupadd docker
YOU=$(whoami)
sudo usermod -aG docker $YOU

