source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle gitfast
antigen bundle fzf
antigen bundle asdf
antigen bundle tmux

# Syntax highlighting/suggestions/completions bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# local plugin
antigen bundle danwald/omz-utils@main

# Load the theme.
antigen theme bira

# Tell Antigen that you're done.
antigen apply


for fp in ~/.fzf.zsh ~/.envs ~/.aliases ~/.zshrc_local ~/.zshrc_secret
do
    [ -f $fp ] && echo "loading $fp" > /dev/null  && source $fp
done

fpath+=~/.zfunc

unsetopt correct_all
unsetopt share_history

. ~/z/z.sh

ulimit -n 524288 unlimited


autoload -Uz compinit
compinit

source <(kubectl completion zsh)

eval "$(starship init zsh)"
