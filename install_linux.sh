#!/usr/bin/env sh

sudo apt-get update
sudo apt-get install -y zsh
chsh -s $(which zsh)

sudo apt-get install -y \
    bash \
    bash-git-prompt \
    bitwarden-cli \
    btop \
    coreutils \
    docker \
    doggo \
    duf \
    dust \
    eza \
    fastfetch \
    fd \
    findutils \
    fzf \
    gh \
    git \
    git-delta \
    gnupg \
    gping \
    htop \
    iperf3 \
    jnv \
    jq \
    kondo \
    mas \
    nvm \
    tealdeer \
    tmux \
    tokei \
    tree \
    wget \
    zoxide \
    zsh \
    zsh-syntax-highlighting
