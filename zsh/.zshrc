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
# (if using zsh-syntax-highlighting, it must be placed last)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# exa -- a modern replacement for ls
# https://the.exa.website/docs/colour-themes
export LS_COLORS="di=1;35:ln=1;34"
export EXA_COLORS="ur=1;34:uw=1;36:ux=1;33:ue=1;33:gr=34:gw=36:gx=33:tr=34:tw=36:tx=33:xa=30:da=30:uu=30:un=37:gu=30:gn=37:gm=33:gv=36:xx=30:hd=30"

# Aliases
alias l="exa --all --long --git --color-scale --time-style=long-iso"
alias ll="l --tree --level=2"
alias lll="l --tree --level=3"

alias vim=nvim

# Python

#eval "$(pyenv init - zsh --no-rehash)"
#eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
function init_conda() {
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
}
# <<< conda initialize <<
