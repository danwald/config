#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "This has to be run with sudo" 1>&2
    exit 1
fi

set -e 
DIR=`pwd -P $0`

echo "Updating packages .."
apt-get update -qy > /dev/null
echo "Installing packages .."
apt-get install -qy curl vim zsh byobu > /dev/null

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/.screenrc .screenrc
chown -R $USER:$USER .vim .screenrc .vimrc

echo "Installing zsh's pprompt .. "
curl -L --silent --output /tmp/stderr.out http://aperiodic.net/phil/prompt/prompt.txt > .pprompt

echo "Installing vim's xoria256 .. "
curl -L --silent --output /tmp/stderr.out https://raw2.github.com/vim-scripts/xoria256.vim/master/colors/xoria256.vim > .vim/colors/xoria256.vim

echo "Changing your shell to zsh .."
chsh -s `which zsh` $USER

echo "All good in the hood. Re-login and don't overwrite the zsh config when prompted"
popd > /dev/null
