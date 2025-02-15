#!/usr/bin/env sh

# Install Brew
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.bash_profile.local
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $ZDOTDIR/.zshrc.local
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

brew install zsh
sudo chsh -s $(brew --prefix)/bin/zsh
brew bundle --file ./macos/Brewfile
brew bundle --file ./macos/Caskfile
