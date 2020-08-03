#!/bin/bash

cd misc &> /dev/null

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
rustup component add rust-src
rustup toolchain add nightly

mkdir ~/workspace

git config --global pull.ff only
