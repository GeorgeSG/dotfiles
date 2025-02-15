#!/usr/bin/env sh

sudo apt-get update
sudo apt-get install -y zsh
chsh -s $(which zsh)

sudo apt-get install -y \
    bash \
    btop \
    coreutils \
    docker \
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
    tmux \
    tree \
    wget \
    zoxide \
    zsh \
    zsh-syntax-highlighting

sudo snap install doggo
sudo snap install dust
# sudo snap install fastfetch
# sudo snap install fd
# sudo snap install jnv
# sudo snap install kondo
# sudo snap install tokei
