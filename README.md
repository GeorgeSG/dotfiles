dotfiles
========

Personal dotfiles for macOS and Linux, managed with [dotbot](https://github.com/anishathalye/dotbot).

## Install

```sh
git clone --recursive git@github.com:GeorgeSG/dotfiles.git ~/Git/dotfiles
cd ~/Git/dotfiles
./install
```

### macOS - first time setup

```sh
# Installs Xcode tools, sets macOS defaults, clones personal repos
./install setup-once

# Installs personal apps (Bitwarden, Discord, Spotify, etc.)
./install personal
```

### Linux

```sh
# Default install handles everything - installs apt packages, sets zsh as default shell
./install
```
