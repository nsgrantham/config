# Set a fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1

# Enable repeating keys for all apps
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a fast mouse speed
defaults write -g com.apple.mouse.scaling 5.0

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Automatically hide and show Menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Move Dock to left side of screen
defaults write com.apple.dock orientation left

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable subpixel antialiasing for non-Apple LCDs
# (Not sure if both this command and the one above are necessary)
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

# Use column view in all Finder windows by default
# Four-letter codes for the view modes: icnv, Nlsv, clmv, Flwv
# Remove all .DS_Store files beforehand to best ensure the Finder view takes effect everywhere
find . -name '.DS_Store' -type f -delete
defaults write com.apple.Finder FXPreferredViewStyle clmv
killall Finder

# Enable debug menu in Safari
defaults write com.apple.Safari IncludeDebugMenu -bool true