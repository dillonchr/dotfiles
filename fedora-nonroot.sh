#!/bin/bash
set -e

chsh -s $(which zsh) wallaby
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -s "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" > "${ZSH_CUSTOM}/themes/bullet-train.zsh-theme"

mkdir -p ~/.config/terminator
cat - > ~/.config/terminator/config <<EOF
[global_config]
  homogeneous_tabbar = False
  scroll_tabbar = True
  window_state = maximise
[keybindings]
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_color = "#1d1f28"
    cursor_color = "#c574dd"
    font = Source Code Pro 9
    foreground_color = "#fdfdfd"
    palette = "#282a36:#f37f97:#5adecd:#f2a272:#8897f4:#c574dd:#79e6f3:#fdfdfd:#414458:#ff4971:#18e3c8:#ff8037:#556fff:#b043d1:#3fdcee:#bebec1"
    use_system_font = False
    visible_bell = True
EOF

echo "ZSH_THEME=\"bullet-train\"" >> ~/.zshrc
source ~/.zshrc

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "wallaby@$(hostname)"
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

mkdir -p ~/git

echo "===== Think we got it ======"
