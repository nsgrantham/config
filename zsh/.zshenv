# xdg
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

# r
export R_PROFILE_USER=$XDG_CONFIG_HOME/r/Rprofile

# python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc.py
#export PYENV_ROOT=$HOME/.pyenv
#export PATH=$PYENV_ROOT/bin:$PATH

# sqlite
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite/history

# ruby
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# rust
source "$HOME/.cargo/env"

# exa
# https://the.exa.website/docs/colour-themes
export LS_COLORS="di=1;35:ln=1;34"
export EXA_COLORS="ur=1;34:uw=1;36:ux=1;33:ue=1;33:gr=34:gw=36:gx=33:tr=34:tw=36:tx=33:xa=30:da=30:uu=30:un=37:gu=30:gn=37:gm=33:gv=36:xx=30:hd=30"
