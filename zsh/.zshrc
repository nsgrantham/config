ZSH_THEME="nsgrantham"  # in $ZSH_CUSTOM/themes/

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# Change color of zsh-autosuggestions
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#62619d"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5959a6"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# (zsh-syntax-highlighting must be the last plugin sourced)
plugins=(git poetry zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases

alias l="exa --all --long --git --color-scale --no-user --no-time"
alias ll="exa --all --long --git --color-scale --time-style=long-iso"

alias vim=nvim
