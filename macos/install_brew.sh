#!/usr/bin/env bash

# Check for Homebrew and install if missing
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.bash_profile.local
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

brew tap homebrew/bundle

brew bundle --file ./macos/Brewfile
