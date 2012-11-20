# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# User specific aliases and functions
alias make='make -j5'
alias ssh='ssh -X'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias got='git '
alias get='git '
alias ls='ls --color=auto '
alias lsd='find . -maxdepth 1 -type d'
alias ds='dirs -vlp '

fack() 
{ 
    dir=""
    if [[ $# -lt  1 ]] ; then
        echo "specify a pattern"
        return 1
    fi


    if [[ -z $2 ]] ; then
        dir="."
    else
        dir=$2
    fi

    echo "seachin for file pattern \"$1\"  in \"$dir\" directory"; 
    ack -f -g $pat $dir 
}


# completion crap
fpath=(~/.zsh/functions ~/.zsh/local-dist-funcs)

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
export PATH=$HOME/bin:$PATH:

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
