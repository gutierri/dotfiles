#!/usr/bin/env bash

echo "installing packages..."
# sudo apt install -y $(grep -iPo '"[a-z].+"' apt/Aptfile | tr -d '"')

echo "stow links..."
stow -R X bash git ratpoison screen vim zathura rofi systemd
