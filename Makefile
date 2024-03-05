linux: link bash_git_prompt tmux vim
macos: link link_mac mac_setup bash_git_prompt brew cask tmux vim

link:
	-rm ~/.aliases
	-rm ~/.bash_profile
	-rm ~/.bashrc
	-rm ~/.git-completion.bash
	-rm ~/.gitconfig
	-rm ~/.tmux.conf
	-rm ~/.zsh/.zprompt
	-rm ~/.zsh/.zshrc
	mkdir -p ~/.zshs
	ln -s ~/Git/dotfiles/git/.git-completion.bash ~
	ln -s ~/Git/dotfiles/git/.gitconfig ~
	ln -s ~/Git/dotfiles/shell/.aliases ~
	ln -s ~/Git/dotfiles/shell/.bashrc ~
	ln -s ~/Git/dotfiles/shell/.bash_profile ~
	ln -s ~/Git/dotfiles/shell/.zprompt ~/.zsh/
	ln -s ~/Git/dotfiles/shell/.zshrc ~/.zsh/
	ln -s ~/Git/dotfiles/tmux/.tmux.conf ~

link_mac:
	-rm ~/.hushlogin
	ln -s ~/Git/dotfiles/macos/.hushlogin ~

mac_setup:
	./macos/macos_setup.sh

brew:
	./macos/install_brew.sh
	sudo chsh -s /usr/local/bin/bash

cask:
	brew bundle --file ./macos/Caskfile

cask_personal:
	brew bundle --file ./macos/Caskfile.personal

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	-rm ~/.tmux/themes
	ln -s ~/Git/dotfiles/tmux/themes ~/.tmux/themes

bash_git_prompt:
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	-rm ~/.git-prompt-colors
	ln -s ~/Git/dotfiles/git/.git-prompt-colors.sh ~

vim:
	ln -s ~/Git/dotfiles/.vim ~
	ln -s ~/Git/dotfiles/.vimrc ~
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
