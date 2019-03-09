#!/usr/bin/env bash

set -e 
DIR=`pwd -P $0`

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.config ~/bin
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/.screenrc .screenrc
ln -sfv $DIR/.gitconfig .gitconfig
ln -sfv $DIR/.zshrc .zshrc
ln -sfv $DIR/.ackrc .ackrc
ln -sfv $DIR/flake8 ~/.config/flake8
ln -sfv $DIR/.ctags .ctags
ln -sfv $DIR/.ctagsignore .ctagsignore
ln -sfv $DIR/.hammerspoon .
ln -sfv $DIR/bin/sag.py ~/bin/sag

echo "Installing oh-my-zsh .. "
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mkdir ~/.oh-my-zsh/plugins/danwald/
ln -sfv $DIR/danwald.plugin.zsh ~/.oh-my-zsh/plugins/danwald/danwald.plugin.zsh

echo "Installing vim's xoria256 .. "
curl -LSs https://raw.githubusercontent.com/vim-scripts/xoria256.vim/master/colors/xoria256.vim -o  .vim/colors/xoria256.vim

echo "Changing your shell to zsh .."
chsh -s `which zsh` $USER

echo "Installing vundle for your vim's plugin needs .."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing google's python indent plugin"
pushd $HOME/.vim/plugins > /dev/null
curl -Os https://github.com/google/styleguide/blob/gh-pages/google_python_style.vim
popd > /dev/null

echo "Installing gpakosz's .tmux .."
pushd $HOME > /dev/null
git clone https://github.com/gpakosz/.tmux.git
ln -sfv .tmux/.tmux.conf
cp -v .tmux/.tmux.conf.local .
popd > /dev/null

echo "Downloading Tmux plugin Manager"
echo "Ammending tmux.local with TmuxPluginManager|tmux-resurrect|tmux|tmux-continuum"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cat $DIR/.danwald.tmux.local >> $HOME/.tmux.conf.local

echo "All good in the hood. Re-login and don't overwrite the zsh config when prompted"
popd > /dev/null
