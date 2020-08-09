#!/bin/bash

cd pkgs &> /dev/null

if [ $(whoami) != "root" ]
then
	echo $0 needs root
	exit 1
fi

pacman -Sy

for PACKAGE_ADD in $(awk '$1=="+"{print $2}' apkgs)
do
	echo "Installing package '$PACKAGE_ADD'"
	pacman --noconfirm -S $PACKAGE_ADD
done

for PACKAGE_REMOVE in $(awk '$1=="-"{print $2}' apkgs)
do
	echo "Removing package '$PACKAGE_REMOVE'"
	pacman --noconfirm -Rs $PACKAGE_REMOVE
done
