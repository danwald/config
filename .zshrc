export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
plugins=(git brew wd docker danwald)
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

alias cd='pushd > /dev/null'
alias pd='popd > /dev/null'
alias ds='dirs -pv'
alias git_mod="git status | grep modified | awk '{print \$2}'"
alias gdanwald="git config --local user.email danwald79@gmail.com"

[ -f ~/.zshrc_local ] && . ~/.zshrc_local

unsetopt share_history

function dbash(){
    docker exec -it $1 bash
}
alias clean_docker="docker rm (docker ps -a | grep Exited | awk '{print \$1 }') && docker rmi (docker images -aq)"
