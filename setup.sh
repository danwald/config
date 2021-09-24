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
Linux) PKGMGR='sudo apt-get -y' ;;
Darwin) PKGMGR='brew' ;;
esac

PKGS="zsh curl git vim cmake ctags ripgrep coreutils fzf zlib readline tmux keybase watch exa asdf"

PYPKGS="pyflakes pylint rope mccabe pycodestyle pydocstyle autopep8 python-language-server youtube-dl isort ipython ipdb magic-wormhole awscli twine setuptools wheel pre-commit grip virtualenv virtualenvwrapper"

$LOG="/tmp/dsetup.log"
echo "Updating your packages and install pre-requisites (logging to $LOG)"
$PKGMGR update > $LOG
$PKGMGR install $PKGS > $LOG

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.config ~/bin ~/sandbox ~/.ssh ~/Envs
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/.gitconfig .gitconfig
ln -sfv $DIR/.gitignore .gitignore
ln -sfv $DIR/.zshrc .zshrc
ln -sfv $DIR/.aliases .aliases
ln -sfv $DIR/.envs .envs
ln -sfv $DIR/.ackrc .ackrc
cp -v $DIR/.ctags .ctags
echo "---exclude=@$HOME/.ctagsignore" >> .ctags
ln -sfv $DIR/.ctagsignore .ctagsignore
ln -sfv $DIR/.hammerspoon .
ln -sfv $DIR/bin/sag.py ~/bin/sag
ln -sfv $DIR/bin/sag.py ~/bin/sag
ln -sfv $DIR/pyproject.toml pyproject.toml
cp -v $DIR/ssh_config ~/.ssh/config

echo "Installing oh-my-zsh .. "
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null
mkdir ~/.oh-my-zsh/custom/plugins/danwald/
ln -sfv $DIR/danwald.plugin.zsh ~/.oh-my-zsh/custom/plugins/danwald/danwald.plugin.zsh

echo "Changing your shell to zsh .."
chsh -s `which zsh` $USER

echo "Installing vundle for your vim's plugin needs .."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null

echo "Installing google's python indent plugin"
pushd $HOME/.vim/plugins > /dev/null
curl -Os https://github.com/google/styleguide/blob/gh-pages/google_python_style.vim
popd > /dev/null

echo "Installing gpakosz's .tmux .."
pushd $HOME > /dev/null
git clone https://github.com/gpakosz/.tmux.git > /dev/null
ln -sfv .tmux/.tmux.conf
cp -v .tmux/.tmux.conf.local .
popd > /dev/null

echo "Downloading Tmux plugin Manager"
echo "Ammending tmux.local with TmuxPluginManager|tmux-resurrect|tmux|tmux-continuum"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm > /dev/null
cat $DIR/.danwald.tmux.local >> $HOME/.tmux.conf.local

echo "Overwritting .ssh/authorized_keys from danwald.me"
mkdir -p ~/.ssh
curl -Os https://danwald.me/assets/authorized_keys ~/.ssh/authorized_keys


echo "install asdf python/node"
read -p "Stable python version? " py3
echo "installing $py3"

asdf plugin add nodejs
asdf plugin add python
asdf plugin add golang

asdf install golang latest
asdf global golang latest
asdf install nodejs latest
asdf global nodejs latest
asdf install python latest
asdf install python $py3
asdf global python $py3
asdf list
asdf current

pip install -U pip $PYPKGS

pushd $HOME > /dev/null
git clone https://github.com/rupa/z.git > /dev/null
popd > /dev/null

echo "All good in the hood. Re-login and don't overwrite the zsh config when prompted"
echo "You have to install pip install pynvim into vims compile python version in brew"
echo "Oh and run the command below to install your vim plugins .. or do a ':PluginInstall' in vim"
echo 'vim +PluginInstall +qall'
popd > /dev/null
