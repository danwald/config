export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
plugins=(git gitfast danwald fzf asdf)
#loading locals prior src omz to update local plugins
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[ -f ~/.zshrc_dbz ] && source ~/.zshrc_dbz

fpath+=~/.zfunc


unsetopt correct_all
unsetopt share_history

. /usr/local/etc/profile.d/z.sh

ulimit -n 524288 unlimited

export WORKON_HOME=~/Envs
source ~/.asdf/installs/python/3.8.12/bin/virtualenvwrapper.sh
