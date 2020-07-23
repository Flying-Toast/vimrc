#!/bin/bash

cd scripts &> /dev/null

mkdir -p ~/.local/bin
cp ~/.local/bin/* old/ &> /dev/null
for SCRIPT in bin/*
do
	echo "Installing $(basename $SCRIPT) to ~/.local/bin"
	cp $SCRIPT ~/.local/bin
done
