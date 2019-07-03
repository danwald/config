export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
#pplugins=(git brew docker aws python redis-cli danwald)
plugins=(git gitfast danwald awsshutils fzf)
export PATH=$HOME/bin:/usr/local/bin:$HOME/sandbox/git-utils:$PATH
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

function drun(){
    if test -z "$1"
    then
        container=`docker images -q | head -1`
        echo "Using last image container $container"
    else
        container=$1
    fi
    docker run -d $container
}

alias dps='docker ps'
alias dim='docker images'

#https://www.calazan.com/docker-cleanup-commands/
#Kill all running containers.
alias dkall='docker kill $(docker ps -q)'

#Delete all stopped containers.
alias dcc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -aq)'

#Delete all untagged images.
alias dci='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -qa)'


function dtags(){
    curl -s -S "https://registry.hub.docker.com/v2/repositories/$@/tags/" | jq '."results"[]["name"]' |sort
}


export EDITOR=vim
export ENV_DIR=$HOME/envs
export PY_LINCHK_DIR=$HOME/sandbox/dotfiles/python
export DANWALD_CONFIG=$HOME/sandbox/config
export DANWALD_VENV_HOOKS=$DANWALD_CONFIG/virtualenvwrapper_hooks
export DANWALD_GIT_PRE_COMMIT=$DANWALD_CONFIG/.pre-commit-config.yaml
export GIT_TEMPLATE_DIR=$DANWALD_CONFIG/git_hooks
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GOPATH="$HOME/sandbox/go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN/bin
