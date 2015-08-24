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
        container=`docker ps -q | head -1`
        echo "Using last active container $container"
    else
        container=$1
    fi
    docker exec -it $container bash
}

alias dk-ps='docker ps'
alias dk-im='docker images'

#https://www.calazan.com/docker-cleanup-commands/
#Kill all running containers.
alias dk-kall='docker kill $(docker ps -q)'

#Delete all stopped containers.
alias dk-cc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

#Delete all untagged images.
alias dc-i='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dk-c='dockercleanc || true && dockercleani'

export EDITOR=vim
