export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
plugins=(git brew wd danwald)
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
[ -f ~/.zshrc_local ] && . ~/.zshrc_local
