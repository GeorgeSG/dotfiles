#!/usr/bin/env sh

sudo apt-get update
sudo apt-get install -y zsh

zsh_path="$(command -v zsh)"
if [ "$SHELL" != "$zsh_path" ]; then
  sudo chsh -s "$zsh_path" "$(id -un)"
fi

sudo apt-get install -y \
    bash \
    btop \
    coreutils \
    duf \
    eza \
    findutils \
    fzf \
    gh \
    git \
    git-delta \
    gnupg \
    gping \
    htop \
    iperf3 \
    jq \
    tealdeer \
    thefuck \
    tmux \
    tree \
    wget \
    zoxide \
    zsh \
    zsh-syntax-highlighting

if command -v snap >/dev/null 2>&1; then
  sudo snap install doggo
  sudo snap install dust
  # sudo snap install fastfetch
  # sudo snap install fd
  # sudo snap install jnv
  # sudo snap install kondo
  # sudo snap install tokei
fi
