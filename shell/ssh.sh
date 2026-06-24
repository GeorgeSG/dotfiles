#!/usr/bin/env bash

echo "Generating a new SSH key..."

read -p "Enter your email: " SSH_EMAIL

if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "~/.ssh/id_ed25519 does not exist, generating a new SSH key...";
  ssh-keygen -t ed25519 -C $SSH_EMAIL -f ~/.ssh/id_ed25519

  eval "$(ssh-agent -s)"
  ssh-add -K ~/.ssh/id_ed25519

  touch ~/.ssh/config
  echo -e "\nHost github.com\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee -a ~/.ssh/config
else
  echo "SSH key already exists, skipping generation..."
fi;

echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' to get the public key"
