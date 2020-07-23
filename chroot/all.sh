#!/bin/bash

cd chroot &> /dev/null

pkgs/install.sh
services/enable.sh
sudo/install.sh
