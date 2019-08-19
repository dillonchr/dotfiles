#!/bin/bash

# get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install macvim --with-override-system-vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "dillonchr"
eval "$(ssh-agent -s)"

cat - >> ~/.ssh/config <<CONF
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
CONF

ssh-add -K ~/.ssh/id_ed25519

open https://iterm2.com/downloads/stable/iTerm2-3_3_1.zip

