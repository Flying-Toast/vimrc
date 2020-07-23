#!/bin/bash

cd vimrc &> /dev/null

touch ~/.vimrc
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
mv ~/.config/nvim/init.vim init.vim.old
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ~/.config/nvim/init.vim

#install vim-plug:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv ~/.vimrc vimrc.old

cat plugs.vim >> ~/.vimrc
vim -c "PlugInstall | qa"
vim -c "PlugUpdate | qa"
cat config.vim >> ~/.vimrc
