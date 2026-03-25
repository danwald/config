fpath+=~/.zfunc
FPATH="$HOME/.docker/completions:$HOME/.kube/completions:$FPATH"
autoload -Uz compinit
compinit

source ~/.antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt


for fp in ~/.fzf.zsh ~/.envs ~/.aliases ~/.zshrc_local ~/.zshrc_secret
do
    [ -f $fp ] && echo "loading $fp" > /dev/null  && source $fp
done

unsetopt correct_all
unsetopt share_history

. ~/z/z.sh

ulimit -n 524288 unlimited

eval "$(starship init zsh)"
