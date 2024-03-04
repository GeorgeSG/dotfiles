linux: link bash_git_prompt tmux vim
macos: link bash_git_prompt brew cask tmux vim

link:
	-ln -s ~/Git/dotfiles/.bash_aliases ~
	-ln -s ~/Git/dotfiles/.bashrc ~
	-ln -s ~/Git/dotfiles/.git-completion.bash ~
	-ln -s ~/Git/dotfiles/.gitconfig ~
	-ln -s ~/Git/dotfiles/.tmux.conf ~

brew:
	-sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	-brew bundle --file ./macos/Brewfile
	-sudo chsh -s /usr/local/bin/bash

cask:
	brew bundle --file ./macos/Caskfile

cask_personal:
	-brew bundle --file ./macos/Caskfile.personal

tmux:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	-ln -s ~/Git/dotfiles/.tmux/themes ~/.tmux/themes

bash_git_prompt:
	-git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	-ln -s ~/Git/dotfiles/.git-prompt-colors.sh ~

vim:
	-ln -s ~/Git/dotfiles/.vim ~
	-ln -s ~/Git/dotfiles/.vimrc ~
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
