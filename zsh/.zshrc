# Add local binaries to path
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation
export ZSH=$ZDOTDIR/.oh-my-zsh

# Path to directory with custom plugins and themes
export ZSH_CUSTOM=$ZDOTDIR/custom

ZSH_THEME="nsgrantham"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# Color of zsh-autoseggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7877ab"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# (zsh-syntax-highlighting must be last)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
alias l="exa --all --long --git --color-scale --time-style=long-iso"
alias ll="l --tree --level=2"
alias lll="l --tree --level=3"

eval "$(pyenv init - zsh --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<
