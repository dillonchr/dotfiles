#!/bin/bash
set -e

# install the good stuff
dnf install -y dnf-plugins-core git tmux neovim zsh curl powerline-fonts tlp xclip grubby jq
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
reboot

