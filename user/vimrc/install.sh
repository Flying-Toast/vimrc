#!/bin/bash

cd vimrc &> /dev/null

#install vim-plug:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv ~/.vimrc vimrc.old

cat plugs.vim >> ~/.vimrc
vim -c "PlugInstall | qa"
vim -c "PlugUpdate | qa"
cat config.vim >> ~/.vimrc
