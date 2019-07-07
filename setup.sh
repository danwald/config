#!/usr/bin/env bash
cleanup()
{
    echo "Error detected. Cleaning up"
    rm -rf ~/.tmux ~/.tmux/plugins/tpm ~/.oh-my-zsh ~/.vim/bundle/Vundle.vim\
            $HOME/.tmux.conf.local\ $HOME/.tmux/.tmux.conf\
         ~/.vim/plugins/google_python_style.vim ~/.fzf
    exit 1;
}

trap cleanup 1 2 3 6 14 15
pushd `dirname "$0"` > /dev/null
DIR=`pwd`
popd >/dev/null > /dev/null

case `uname` in
Linux) PKGMGR='sudo apt-get' && PKG='ctags' ;;
Darwin) PKGMGR='brew' && PKG='exuberant-ctags' ;;
esac

PKGS="zsh curl git vim-runtime vim-gui-common"
PKGS="$PKGS $PKG"

echo "Updating your packages and install pre-requisites"
$PKGMGR update
$PKGMGR install zsh curl git vim-runtime vim-gui-common exuberant-ctags

echo "Install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.config ~/bin
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/.gitconfig .gitconfig
ln -sfv $DIR/.zshrc .zshrc
ln -sfv $DIR/.ackrc .ackrc
ln -sfv $DIR/flake8 ~/.config/flake8
cp -v $DIR/.ctags .ctags
echo "---exclude=@$HOME/.ctagsignore" >> .ctags
ln -sfv $DIR/.ctagsignore .ctagsignore
ln -sfv $DIR/.hammerspoon .
ln -sfv $DIR/bin/sag.py ~/bin/sag

echo "Installing oh-my-zsh .. "
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mkdir ~/.oh-my-zsh/custom/plugins/danwald/
ln -sfv $DIR/danwald.plugin.zsh ~/.oh-my-zsh/custom/plugins/danwald/danwald.plugin.zsh

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
echo "Oh and run the command below to install your vim plugins .. or do a ':PluginInstall' in vim"
echo '+vim +PluginInstall +qall'
popd > /dev/null


