XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME


# macOS

brew bundle --file=macos/Brewfile
source $XDG_CONFIG_HOME/macos/set-system-preferences.sh


# Zsh

mv $HOME/.zshenv $HOME/.zshenv-old
echo -e "ZDOTDIR=\$HOME/.config/zsh\n. \$ZDOTDIR/.zshenv" >> $HOME/.zshenv

ZSH_CUSTOM=$XDG_DATA_HOME/zsh/custom

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

mkdir -p $ZSH_CUSTOM/themes
ln -s $XDG_CONFIG_HOME/zsh/nsgrantham.zsh-theme $ZSH_CUSTOM/themes/nsgrantham.zsh-theme


# Neovim

curl -fLo --create-dirs $XDG_DATA_HOME/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# VS Code

ln -s $XDG_CONFIG_HOME/vscode/settings.json $HOME/Library/ApplicationSupport/Code/User/settings.json
ln -s $XDG_CONFIG_HOME/vscode/keybindings.json $HOME/Library/ApplicationSupport/Code/User/keybindings.json

