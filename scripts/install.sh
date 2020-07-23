#!/bin/bash

cd scripts &> /dev/null

mkdir -p ~/.local/bin
cp ~/.local/bin/* old/
cp bin/* ~/.local/bin
