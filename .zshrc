source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle gitfast
antigen bundle fzf
antigen bundle asdf

# Syntax highlighting/suggestions/completions bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# local plugin
antigen bundle danwald

# Load the theme.
antigen theme bira

# Tell Antigen that you're done.
antigen apply


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[ -f ~/.zshrc_dbz ] && source ~/.zshrc_dbz
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

fpath+=~/.zfunc

unsetopt correct_all
unsetopt share_history

. ~/z/z.sh

ulimit -n 524288 unlimited
