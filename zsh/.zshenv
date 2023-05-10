# XDG Base Directory Specification
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Add local binaries to path
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-${HOST/.*/}-$ZSH_VERSION"
export HISTFILE="$ZSH_CACHE_DIR/history"
export SHELL_SESSIONS_DISABLE=1

# ohmyzsh
export ZSH="$XDG_DATA_HOME/zsh/ohmyzsh"
export ZSH_CUSTOM="$XDG_DATA_HOME/zsh/custom"

# npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_DEVDIR="$XDG_CACHE_HOME/node-gyp"

# r
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/Rprofile"
export RENV_PATHS_CACHE="$XDG_DATA_HOME/renv"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_VIRTUALENV_CACHE_PATH="$XDG_CACHE_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# poetry
export POETRY_HOME="$XDG_DATA_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"
export PATH="$POETRY_HOME/bin:$PATH"

# sqlite
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite/history"

# bundle (ruby)
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# ghostscript & dvisvgm for tikz from mactex
# https://www.andrewheiss.com/blog/2021/08/27/tikz-knitr-html-svg-fun/
export LIBGS="/usr/local/Cellar/ghostscript/9.55.0/lib/libgs.dylib.9.55"

# exa
# https://the.exa.website/docs/colour-themes
export LS_COLORS="di=1;35:ln=1;34:*.jpg=36:*.jpeg=36:*.png=36:*.PNG=36:*.svg=36:*.pdf=33:*.zip=35"
export EXA_COLORS="ur=34:uw=34:ux=34:ue=34:gr=36:gw=36:gx=36:tr=33:tw=33:tx=33:xa=30:da=30:uu=30:un=37:gu=30:gn=37:gm=33:gv=36:xx=30:hd=30"
