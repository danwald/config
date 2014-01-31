# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# User specific aliases and functions
alias make='make -j5'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias got='git '
alias get='git '
alias wgb='git branch 2> /dev/null | grep "*"'
alias ls='ls --color=auto '
alias lsd='find . -maxdepth 1 -type d'
alias ds='dirs -vlp '
alias grep='grep --color=auto'
alias tree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\\/]*\\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias ack='ack-grep'
alias fack='ack-grep -l'
alias pd='popd'
alias pgrep='pgrep -l'
alias apt-get='apt-fast'

alias memcached_flush='echo "flush_all" | nc localhost 11211'
alias memc='/usr/bin/memcached -d -p 11211'
alias email='python -m smtpd -n -c DebuggingServer localhost:1025'
alias pep8_check='git diff --unified=0 master | pep8 --diff'
alias clear_pyc='find . -name \*.pyc | xargs rm'

function ff(){
    if [[ $# == 0 ]]; then
        echo "usage: $0 [dir] filename|regex"
        return 1
    else
        if [[ $# > 2 ]]; then
            echo "Ignoring args greater than $2"
        fi
        if [[ $# > 1 ]]; then
            find $1 -name "$2"
        else
            find . -name "$1"
        fi
    fi
}
        

waitfor()
{
    if [[ $# == 0 ]] ; then
        echo usage: $0 pid
        return 1
    else
        if [[ ! -e /proc/$1 ]]; then
            echo pid $1 not found
            return 1
        fi
    fi
    while [[ -e /proc/$i ]]; do
        sleep 1 
    done
}


autoload -U compinit
compinit

ZLS_COLORS=$LS_COLORS
zmodload zsh/complist

#emacs keybinds not EDITORS
bindkey -e

#correct backspace bind
bindkey "^?" backward-delete-char

#------------------------------------------------------------------
# A few key bindings
#------------------------------------------------------------------
bindkey '^[[1~' beginning-of-line   # home
bindkey '^[[4~' end-of-line         # end

#------------------------------------------------------------------
# I like my history to go way back
#------------------------------------------------------------------
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zhistory

# report time on long commands
REPORTTIME=2

#------------------------------------------------------------------
# setup a few options
#------------------------------------------------------------------
setopt AUTO_PUSHD   # make cd act like pushd
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates when a new 
                            # command is stored in the history
setopt HIST_REDUCE_BLANKS # remove extra white space from the history
setopt list_types # list file types when completing

#my paths
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# function for setting terminal title
title() 
{
   if [[ $TERM == "screen" ]]; then
     # Use these two for GNU Screen:
     print -nR $'\033k'$1$'\033'\\\ > /dev/null
     print -nR $'\033]0;'$2$'\a' > /dev/null
   elif [[ $TERM == "xterm" || $TERM == "rxvt" || $TERM == "rxvt-unicode" ]]; then
     # Use this one instead for XTerms:
     print -nR $'\033]0;'$*$'\a' > /dev/null
   fi
}

get_git_branch() { 
   git branch | awk '/^\*/ { print $2 }'
}

get_git_dirty() { 
   git diff --quiet || echo '*'
}

get_git_prompt() { 
   git branch &> /dev/null || return 1 
   echo "[$(get_git_branch)$(get_git_dirty)]"
   #echo "[$(get_git_branch)]"
}

. ~/.pprompt

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
