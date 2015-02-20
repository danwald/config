export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
plugins=(git brew wd danwald)
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

alias cd='pushd > /dev/null'
alias pd='popd > /dev/null'
alias ds='dirs -pv'

[ -f ~/.zshrc_local ] && . ~/.zshrc_local
