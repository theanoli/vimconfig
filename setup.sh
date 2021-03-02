#!/bin/bash

mv vimconfig ~/.vim

echo "source ~/.vim/vimrc" > ~/.vimrc
cd ~/.vim; git submodule update --init

sudo apt install neovim
echo vim="nvim" >> ~/.bash_aliases; source ~/.bash_aliases

mkdir ~/.config/nvim
cd ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > init.vim
echo "let &packpath = &runtimepath" >> init.vim
echo "source ~/.vimrc" >> init.vim

