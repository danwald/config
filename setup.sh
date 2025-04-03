#!/usr/bin/env bash
cleanup()
{
    echo "Error detected. Cleaning up"
    rm -rf ~/.tmux ~/.tmux/plugins/tpm ~/.oh-my-zsh ~/.vim/bundle/Vundle.vim\
            $HOME/.tmux.conf.local $HOME/.tmux/.tmux.conf ~/.fzf
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

PKGS="zsh curl git nvim cmake ctags ripgrep coreutils fzf zlib readline tmux keybase watch lsd jo jq gimp hugin pandoc git-delta font-hack-nerd-font fontforge asdf"

PYPKGS="pynvim ipython ipdb setuptools wheel pipx"
PYPKG_BINS="youtube-dl magic-wormhole awscli twine grip dunk pre-commit httpx[cli] llm"

$LOG="/tmp/dsetup.log"
echo "Updating your packages and install pre-requisites (logging to $LOG)"
$PKGMGR update >> $LOG
$PKGMGR install `echo $PKGS` >> $LOG

echo "Creating directories and links ... will overwrite"
pushd $HOME > /dev/null
mkdir -p ~/.vim/plugins ~/.vim/colors ~/.vim/autoload ~/.vim/bundle ~/.config ~/bin ~/sandbox ~/.ssh ~/Envs ~/.config/nvim/
ln -sfv $DIR/.vimrc .vimrc
ln -sfv $DIR/init.vim ~/.config/nvim/init.vim
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
ln -sfv $DIR/bin/time_ms ~/bin/time_ms
ln -sfv $DIR/pyproject.toml pyproject.toml
cp -v $DIR/ssh_config ~/.ssh/config

echo "Installing oh-my-zsh .. "
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null

echo "Insatalling antigen .. "
curl -Ls git.io/antigen > ~/antigen.zsh

echo "Changing your shell to zsh .."
chsh -s `which zsh` $USER

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

echo "Getting kubectl aliases"
curl -s -o ~/.kubectl_aliases https://raw.githubusercontent.com/ahmetb/kubectl-aliases/refs/heads/master/.kubectl_aliases

read -p "Stable python version? " STABLE_PY3
echo "installing $STABLE_PY3"
echo "export STABLE_PY3=$STABLE_PY3" >> ~/.envs_local

asdf plugin add nodejs
asdf plugin add python
asdf plugin add golang

asdf install golang latest
asdf install nodejs latest
asdf install python latest
asdf install python $STABLE_PY3
asdf set -u nodejs latest
asdf set -u golang latest
asdf set -u python $STABLE_PY3
asdf list
asdf current

echo "installing python libs to global"
python -m pip install -U pip $PYPKGS
asdf reshim python $STABLE_PY3
echo "installing python bins with pipx"
for pkg in $PYPKG_BINS
do
pipx install "$pkg"
done

echo "no global pip installs allowed!"
pip config set global.require-virtualenv True


pushd $HOME > /dev/null
git clone https://github.com/rupa/z.git > /dev/null
popd > /dev/null

echo "installing plug nvim plugin manager and all plugins"
pushd $HOME > /dev/null
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
popd > /dev/null

echo "You need to install https://larsenwork.com/monoid/ font, patch retina via https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#font-patcher"
echo "All good in the hood. Re-login and don't overwrite the zsh config when prompted"
popd > /dev/null
