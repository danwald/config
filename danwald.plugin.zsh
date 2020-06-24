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

function waitfor()
{
    if [[ $# == 0 ]] ; then
        echo "usage: $0 pid"
        return 1
    else
        if [[ ! -e /proc/$1 ]]; then
            echo "pid $1 not found"
            return 1
        fi
    fi
    while [[ -e /proc/$i ]]; do
        sleep 1 
    done
}

function rp()
{
    if [[ $# == 0 ]] ; then
        echo "usage: $0 process_name"
        return 1
    else
        for i in $@ 
        do
            ps aux | grep $i | grep -v grep
        done
    fi
}

function rpi()
{
    [[ $# != 0 ]] && rp $@ | awk '{print $2}'
}

function kp()
{
    if [[ $# == 0 ]] ; then
        echo "usage: $0 process_name"
        return 1
    else
        SIG='-INT'
        if [[ $# -gt 1 ]] ; then
            SIG=$2
        fi
        ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill $SIG
    fi
}

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

function dtags(){
    curl -s -S "https://registry.hub.docker.com/v2/repositories/$@/tags/" | jq '."results"[]["name"]' |sort
}


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

# via https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# ch - browse chrome history
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'
  CHROME_HISTORY_FILE=${CHROME_HISTORY_FILE:=$HOME/Library/Application\ Support/Google/Chrome/Default/History}
  cp -f $CHROME_HISTORY_FILE /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

reset_network()
{
	ADAPTER=${2:=en0}
	echo "Resetting network adapter $ADAPTER"
	sudo ifconfig $ADAPTER down && sudo route -n flush && sudo ifconfig $ADAPTER up
}
