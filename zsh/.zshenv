# XDG Base Directory Specification
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Add local binaries to path
#export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-${HOST/.*/}-$ZSH_VERSION"
export SHELL_SESSIONS_DISABLE=1
export HISTFILE="$ZSH_CACHE_DIR/history"
export SAVEHIST=10000  # how many commands zsh saves to history file
export HISTSIZE=10000  # how many commands zsh loads into memory
setopt HIST_IGNORE_ALL_DUPS  # don't save duplicates
setopt HIST_FIND_NO_DUPS     # don't show duplicates in search

# ohmyzsh
export ZSH="$XDG_DATA_HOME/zsh/ohmyzsh"
export ZSH_CUSTOM="$XDG_DATA_HOME/zsh/custom"

# tmux
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_DEVDIR="$XDG_CACHE_HOME/node-gyp"

# node
export NODE_REPL_HISTORY="$XDG_CACHE_DIR/node/history"

# psql
export PSQL_HISTORY="$XDG_CACHE_DIR/psql/history"

# r
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/Rprofile"
export RENV_PATHS_CACHE="$XDG_DATA_HOME/renv"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_VIRTUALENV_CACHE_PATH="$XDG_CACHE_HOME/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

# poetry
export POETRY_HOME="$XDG_DATA_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"
#export PATH="$POETRY_HOME/bin:$PATH"

# sqlite
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite/history"

# bundle (ruby)
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_AUTO_UPGRADE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
#export PATH="/opt/homebrew/bin:$PATH"

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
#export PATH="$CARGO_HOME/bin:$PATH"

# ghostscript & dvisvgm for tikz from mactex
# https://www.andrewheiss.com/blog/2021/08/27/tikz-knitr-html-svg-fun/
export LIBGS="/usr/local/Cellar/ghostscript/9.55.0/lib/libgs.dylib.9.55"

# exa
# https://the.exa.website/docs/colour-themes
export LS_COLORS="di=1;34:ln=1;36:*.jpg=36:*.jpeg=36:*.png=36:*.PNG=36:*.svg=36:*.pdf=33:*.zip=35"
export EXA_COLORS="ur=30:uw=30:ux=30:ue=30:gr=30:gw=30:gx=30:tr=30:tw=30:tx=30:su=30:sf=30:xa=30:da=30:uu=30:un=1;30:gu=30:gn=1;30:ga=36:gm=33:gd=31:gv=36:gt=35:xx=30:hd=30"
