#!/usr/bin/env bash

set -e

git submodule sync --recursive
# the following have to run after linking ~/.gitconfig
git update-submodules
git cleanall -f \
  home/config/tmux/plugins \
  home/config/bash/bash-git-prompt \
  home/config/zsh/plugins \
  home/vim/plugged/

# install BD zsh plugin - this needs to happen after the cleanall
mkdir -p ~/.config/zsh/plugins/bd
curl -fsSL https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh \
  > ~/.config/zsh/plugins/bd/bd.zsh

# Platform-specific
case "$(uname)" in
  Darwin) ./shell/install_apps_macos.sh ;;
  Linux)  ./shell/install_apps_linux.sh ;;
esac
