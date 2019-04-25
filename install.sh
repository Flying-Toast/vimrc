#!/bin/bash

#install vim-plug:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#backup existing vimrc to this directory
mv ~/.vimrc ./oldVimrc

#copy plugins to vimrc:
cat plugs.vim >> ~/.vimrc

#run PlugInstall in vim to install vim-plug plugins, then quit vim
vim -c "PlugInstall | qa"

#move the rest of the vimrc file, now that the plugins have been installed
cat config.vim >> ~/.vimrc
