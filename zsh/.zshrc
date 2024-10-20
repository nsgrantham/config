# .zshrc

source <(fzf --zsh)
source <(pyenv init -)
source <(zoxide init --cmd cd zsh)

if [[ $TERM_PROGRAM != "Apple_Terminal" ]]; then
  source <(oh-my-posh init zsh --config "$XDG_CONFIG_HOME/ohmyposh/ohmyposh.json")
fi

alias l="ls -al --color"
alias vim=nvim


ZSH_PLUGINS="$XDG_DATA_HOME/zsh/plugins"  


# zsh-defer ---------------------------

if [[ ! -d $ZSH_PLUGINS/zsh-defer ]]; then
    git clone -q https://github.com/romkatv/zsh-defer "$ZSH_PLUGINS/zsh-defer"
fi
source "$ZSH_PLUGINS/zsh-defer/zsh-defer.plugin.zsh"


# zsh-completions ---------------------

if [[ ! -d $ZSH_PLUGINS/zsh-completions ]]; then
    git clone -q https://github.com/zsh-users/zsh-completions "$ZSH_PLUGINS/zsh-completions"
fi
fpath=("$ZSH_PLUGINS/zsh-completions/src" $fpath)
zsh-defer source "$ZSH_PLUGINS/zsh-completions/zsh-completions.plugin.zsh"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # Disable case-sensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Enable colors
zstyle ':completion:*' menu no                           # Disable menu (in favor of fzf-tab)

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"


# fzf-tab -----------------------------
# Must be loaded after compinit and before zsh-autosuggestions

if [[ ! -d $ZSH_PLUGINS/fzf-tab ]]; then
    git clone -q https://github.com/Aloxaf/fzf-tab "$ZSH_PLUGINS/fzf-tab"
fi
zsh-defer source "$ZSH_PLUGINS/fzf-tab/fzf-tab.plugin.zsh"

zstyle ':fzf-tab:*' use-fzf-default-opts yes  # $FZF_DEFAULT_OPTS_FILE
zstyle ':fzf-tab:complete:*' fzf-preview \
    '([[ -f $realpath ]] && bat $realpath) || ([[ -d $realpath ]] && tree -C $realpath)'


# zsh-autosuggestions -----------------

if [[ ! -d $ZSH_PLUGINS/zsh-autosuggestions ]]; then
    git clone -q https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS/zsh-autosuggestions"
fi
zsh-defer source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
SAVEHIST=5000                  # Number of commands saved to history
HISTSIZE=$SAVEHIST             # Number of commands loaded into memory from history
HISTDUP=erase                  # Erase duplicates in history
setopt SHARE_HISTORY           # Share history across terminals 
setopt HIST_EXPIRE_DUPS_FIRST  # Expire a duplicate command first when trimming history
setopt HIST_IGNORE_SPACE       # Do not save a command starting with a space
setopt HIST_IGNORE_DUPS        # Do not save a command that was just saved again
setopt HIST_IGNORE_ALL_DUPS    # Delete an old saved command if a new command is a duplicate
setopt HIST_SAVE_NO_DUPS       # Do not write a duplicate command to the history file
setopt HIST_FIND_NO_DUPS       # Do not display a previously found command

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=black"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# zsh-syntax-highlighting -------------

if [[ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS/zsh-syntax-highlighting"
fi
zsh-defer source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

