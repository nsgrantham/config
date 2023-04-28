
# Path to ohmyzsh installation
export ZSH=$XDG_DATA_HOME/zsh/ohmyzsh

# Path to directory with custom plugins and themes
ZSH_CUSTOM=$XDG_DATA_HOME/zsh/custom

# Use custom theme in $ZSH_CUSTOM/themes/
ZSH_THEME="nsgrantham"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# Change color of zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#62619d"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# (zsh-syntax-highlighting must be the last plugin sourced)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Aliases

alias l="exa --all --long --git --color-scale --time-style=long-iso"
alias ll="l --tree --level=2"
alias lll="l --tree --level=3"

alias vim=nvim


# Python

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

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
