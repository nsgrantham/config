
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_STATE_HOME

# macOS

brew bundle --file macos/Brewfile
source macos/set-system-preferences.sh

# VS Code

ln -s $XDG_CONFIG_HOME/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -s $XDG_CONFIG_HOME/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"

