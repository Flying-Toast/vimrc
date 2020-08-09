#!/bin/bash

cd sudo &> /dev/null

if [ $(whoami) != "root" ]
then
	echo $0 needs root
	exit 1
fi

mv /etc/sudoers sudoers.old
cp sudoers /etc/sudoers
chmod 440 /etc/sudoers
