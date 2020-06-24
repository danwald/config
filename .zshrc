export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
plugins=(git gitfast danwald fzf pyenv)
[ -f ~/.zshrc_local ] && . ~/.zshrc_local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs
[ -f ~/.aliases ] && source ~/.aliases
fpath+=~/.zfunc
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt share_history
[ -f ~/.zshrc_dbz ] && . ~/.zshrc_dbz









