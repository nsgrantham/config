# XDG Base Directory Specification
# https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
export SHELL_SESSIONS_DISABLE=1

# zoxide
export _Z0_DATA_DIR="$XDG_DATA_HOME/zoxide"

# bat
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/config"

# tmux
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_DEVDIR="$XDG_CACHE_HOME/node-gyp"

# node
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/node_history"

# psql
export PSQL_HISTORY="$XDG_STATE_HOME/psql/psql_history"

# r
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/Rprofile"
export RENV_PATHS_CACHE="$XDG_DATA_HOME/renv"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_VIRTUALENV_CACHE_PATH="$XDG_CACHE_HOME/pyenv"

# poetry
export POETRY_HOME="$XDG_DATA_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"

# sqlite
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite/sqlite_history"

# ruby
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_AUTO_UPGRADE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# fzf
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/fzf_default_opts"

# man
export MANPAGER="nvim +Man!"


if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export VISUAL="nvim"

export PATH="$CARGO_HOME/bin:$POETRY_HOME/bin:$PYENV_ROOT/bin:$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"

