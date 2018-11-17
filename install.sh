#!/bin/bash

ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/aliases $HOME/.aliases


ln -sf $PWD/zshrc $HOME/.zshrc
ln -sf $PWD/zpreztorc $HOME/.zpreztorc

ln -sf $PWD/dir_colors $HOME/.dircolors

curl -fLo ~/.vim/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "--> TODO: Start tmux and Press Ctrl+a, I to install plugins"
echo "--> TODO: Install Nerdfont"

mkdir -p ~/.dotfiles-addons
git clone https://github.com/ryanoasis/nerd-fonts ~/.dotfiles-addons/nerd-fonts
