#!/usr/bin/env bash

# Copied from https://mths.be/macos
# Also look at https://macos-defaults.com
# Also look at https://gist.github.com/brandonb927/3195465/

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Would you like to set your computer name (as done via System Preferences >> Sharing)?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Set computer name:"
  read COMPUTER_NAME
  sudo scutil --set ComputerName $COMPUTER_NAME
  sudo scutil --set HostName $COMPUTER_NAME
  sudo scutil --set LocalHostName $COMPUTER_NAME
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
fi

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Show the ~/Library folder.
chflags nohidden ~/Library

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable Photos.app from starting everytime a device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


# Set the timezone; see `sudo systemsetup -listtimezones` for other values
# This is throwing errors - investigate
# sudo systemsetup -settimezone "Europe/Sofia" > /dev/null

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10

###############################################################################
# Energy saving                                                               #
###############################################################################

# Sleep the display after 10 minute
sudo pmset -a displaysleep 10

###############################################################################
# Screen                                                                      #
###############################################################################

# Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Desktop & Finder                                                            #
###############################################################################

# Show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Default to list view
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Show icon in title bar
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"

# Show folders first on desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Avoid creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Allow text selection in Quick Look/Preview in Finder by default
defaults write com.apple.finder QLEnableTextSelection -bool true

killall Finder

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

echo "Wipe all (default) app icons from the Dock? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.dock persistent-apps -array
fi

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 30

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Faster dock animation time
defaults write com.apple.dock "autohide-time-modifier" -float "0.2"

# Don't show recents in dock
defaults write com.apple.dock "show-recents" -bool "false"

# Scroll up on app in dock to open expose
defaults write com.apple.dock "scroll-to-open" -bool "true"

killall Dock

###############################################################################
# Menu Bar                                                                    #
###############################################################################

# Set clock format
defaults write com.apple.menuextra.clock "DateFormat" -string "\"HH:mm\""


###############################################################################
# Safari, & WebKit                                                            #
###############################################################################

# Privacy: Don't send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Hiding Safari's sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Enabling Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Making Safari's search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Removing useless icons from Safari's bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enabling the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Adding a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
