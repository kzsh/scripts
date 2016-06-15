#!/bin/bash

# Disable warning for files downloaded from the internet
defaults write com.apple.LaunchServices LSQuarantine -bool NO

# =====================================================================
# Keyboard
# =====================================================================

# Enable character repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

# =====================================================================
# Dock
# =====================================================================

# remove animation for switching spaces
defaults write com.apple.dock expose-animation-duration -int 0; killall Dock
# reset with: defaults delete com.apple.dock expose-animation-duration; killall Dock

# Add a delay before showing the dock
defaults write com.apple.Dock autohide-delay -float 0;
# reset with: defaults delete com.apple.Dock autohide-delay

defaults write com.apple.dock autohide-time-modifier -int 0;
# reset with:`defaults delete com.apple.dock autohide-time-modifier;killall Doc`

killall Dock

# Window animation
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
# reset with: defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool YES

# =====================================================================
# Finder
# =====================================================================

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable ext change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show absolute path in finder's title bar.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

killall Finder

# =====================================================================
# Safari
# =====================================================================

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# =====================================================================
# Chrome
# =====================================================================

#
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

# =====================================================================
# ~/Library
# =====================================================================

# Show the ~/Library folder
chflags nohidden ~/Library

# =====================================================================
# AirDrop
# =====================================================================

# Enable AirDrop over Ethernet and on unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true