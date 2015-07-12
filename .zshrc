export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
plugins=(git brew wd docker danwald)
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
unsetopt correct_all

alias cd='pushd > /dev/null'
alias pd='popd > /dev/null'
alias ds='dirs -pv'
alias git_mod="git status | grep modified | awk '{print \$2}'"
alias gdanwald="git config --local user.email danwald79@gmail.com"

[ -f ~/.zshrc_local ] && . ~/.zshrc_local

unsetopt share_history

function dbash(){
    if test -z "$1"
    then
        container=`docker ps -lq`
        echo "Using last active container $container"
    else
        container=$1
    fi
    docker exec -it $container bash
}

alias clean_docker="docker rm (docker ps -a | grep Exited | awk '{print \$1 }') && docker rmi (docker images -aq)"
alias dps='docker ps'
alias dim='docker images'
