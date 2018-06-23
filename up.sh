#!/usr/bin/env bash

sudo curl -o /usr/local/bin/aptfile https://raw.githubusercontent.com/seatgeek/bash-aptfile/master/bin/aptfile
curl -o /tmp/Aptfile https://raw.githubusercontent.com/gutierri/dotfiles/debian/apt/Aptfile

sudo chmod +x /usr/local/bin/aptfile

sudo /usr/local/bin/aptfile /tmp/Aptfile

git clone https://github.com/gutierri/dotfiles.git $HOME/.dotfiles

python $HOME/.dotfiles/bootstrap link
