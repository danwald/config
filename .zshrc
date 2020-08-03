export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
plugins=(git gitfast danwald fzf)

source $ZSH/oh-my-zsh.sh

[ -f ~/.zshrc_local ] && source ~/.zshrc_local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zshrc_dbz ] && source ~/.zshrc_dbz

fpath+=~/.zfunc

unsetopt correct_all
unsetopt share_history
