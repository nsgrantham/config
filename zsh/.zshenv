# xdg
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export ZSH_COMPDUMP=$ZSH_CACHE_DIR/zcompdump-${HOST/.*/}-$ZSH_VERSION
export HISTFILE=$ZSH_CACHE_DIR/history
export SHELL_SESSIONS_DISABLE=1

# npm
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_DEVDIR=$XDG_CACHE_HOME/node-gyp

# python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc.py
#export PYENV_ROOT=$HOME/.pyenv
#export PATH=$PYENV_ROOT/bin:$PATH

# sqlite
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite/history
source "$HOME/.cargo/env"
