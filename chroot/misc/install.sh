#!/bin/bash

cd misc &> /dev/null

if [ $(whoami) != "root" ]
then
	echo $1 needs root
	exit 1
fi

ln -s /usr/bin/nvim /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
