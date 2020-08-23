#!/bin/bash

cd misc &> /dev/null

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
rustup component add rust-src
rustup toolchain add nightly

mkdir ~/workspace

mkdir ~/.config/git
touch ~/.config/git/config
git config --global pull.ff only
git config --global pager.diff "/usr/share/git/diff-highlight/diff-highlight | less"

pip install --user jedi
