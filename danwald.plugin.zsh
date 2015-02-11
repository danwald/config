function ff(){
    if [[ $# == 0 ]]; then
        echo "usage: $0 [dir] filename|regex"
        return 1
    else
        if [[ $# > 2 ]]; then
            echo "Ignoring args greater than $2"
        fi
        if [[ $# > 1 ]]; then
            dir="$1"
            file="$2"
        else
            dir="."
            file="$1"
        fi
        find $dir -name "$file"

    fi
}

function fnf(){
    if [[ $# == 0 ]]; then
        echo "usage: $0 [dir] filename|regex"
        return 1
    else
        if [[ $# > 2 ]]; then
            echo "Ignoring args greater than $2"
        fi
        if [[ $# > 1 ]]; then
            dir="$1"
            file="$2"
        else
            dir="."
            file="$1"
        fi
        find $dir -type d | grep -v .git | read fd && ls "$fd/$file" > /dev/null 2>&1 || echo "$fd"
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

function kp()
{
    if [[ $# == 0 ]] ; then
        echo usage: $0 process_name
        return 1
    else
        ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9 
    fi
}

#my paths
export PATH=/usr/bin:/usr/local/bin:/sbin/:$PATH:

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
   git branch 2> /dev/null | awk '/^\*/ { print $2 }' || return 1
}

get_git_dirty() {
    git diff --quiet 2> /dev/null
    if [[ "$?" == "1" ]]; then
        echo "*"
    fi
    return $?
}

get_git_prompt() { 
   echo "[$(get_git_branch)$(get_git_dirty)]"
}