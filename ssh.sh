#!/usr/bin/env bash

echo "Generating a new SSH key..."

if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "~/.ssh/id_ed25519 does not exist, generating a new SSH key...";
  ssh-keygen -t ed25519 -C $1 -f ~/.ssh/id_ed25519

  eval "$(ssh-agent -s)"
  ssh-add -K ~/.ssh/id_ed25519

  touch ~/.ssh/config
  echo -e "\nHost github.com\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee -a ~/.ssh/config
fi;



echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' to get the public key"
