#!/usr/bin/env sh

# May require logout / restart to take effect.
# Based on https://gist.github.com/saetia/1623487
# Additional options from https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##
# System
##

# Set standby delay to 24 hours (default is 1 hour)
##sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
#sudo systemsetup -setcomputersleep Off > /dev/null

echo "doing a thing"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

##
# User Interaction
##

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Enable character repeat on keydown
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true 

##
# MISC
##

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo "Done!"