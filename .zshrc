fpath+=~/.zfunc
FPATH="$HOME/.docker/completions:$HOME/.kube/completions:$FPATH"

autoload -Uz compinit
# AIDEV-NOTE: only rebuild completion dump when it's older than 24h, otherwise use cached (-C skips security check)
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump"(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

export ZSH_CACHE_DIR="$HOME/.zsh_cache"

source ~/.antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt


for fp in ~/.fzf.zsh ~/.envs ~/.aliases ~/.zshrc_local ~/.zshrc_secret ~/.local/bin/env
do
    [ -f $fp ] && echo "loading $fp" > /dev/null  && source $fp
done

unsetopt correct_all
unsetopt share_history

. ~/z/z.sh

ulimit -n 524288

# AIDEV-NOTE: cache starship init output; regenerates only when the starship binary is newer than the cache
_starship_cache="$ZSH_CACHE_DIR/starship_init.zsh"
starship init zsh >| "$_starship_cache"
if [[ ! -f "$_starship_cache" || "$commands[starship]" -nt "$_starship_cache" ]]; then
fi
source "$_starship_cache"
unset _starship_cache

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# End of Docker CLI completions
