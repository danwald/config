#!/usr/bin/env bash

set -e 
DIR=`pwd -P $0`

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.config
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/.screenrc .screenrc
ln -sfv $DIR/.gitconfig .gitconfig
ln -sfv $DIR/.zshrc .zshrc
ln -sfv $DIR/.ackrc .ackrc
ln -sfv $DIR/flake8 ~/.config/flake8
ln -sfv $DIR/.ctags .ctags
ln -sfv $DIR/.ctagsignore .ctagsignore
ln -sfv $DIR/.byobu/keybindings.tmux .byobu/keybindings.tmux
ln -sfv $DIR/.byobu/.tmux.conf .byobu/.tmux.conf
ln -sfv $DIR/.hammerspoon .

echo "Installing oh-my-zsh .. "
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mkdir ~/.oh-my-zsh/plugins/danwald/
ln -sfv $DIR/danwald.plugin.zsh ~/.oh-my-zsh/plugins/danwald/danwald.plugin.zsh

echo "Installing vim's xoria256 .. "
curl -LSs https://raw.githubusercontent.com/vim-scripts/xoria256.vim/master/colors/xoria256.vim -o  .vim/colors/xoria256.vim

echo "Changing your shell to zsh .."
chsh -s `which zsh` $USER

echo "Installing vundle for your vim's plugin needs ..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "All good in the hood. Re-login and don't overwrite the zsh config when prompted"
popd > /dev/null
