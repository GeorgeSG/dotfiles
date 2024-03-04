linux: link bash_git_prompt tmux vim
macos: link link_mac bash_git_prompt brew cask tmux vim

link:
	rm ~/.bash_aliases
	rm ~/.bashrc
	rm ~/.bash_profile
	rm ~/.git-completion.bash
	rm ~/.gitconfig
	rm ~/.tmux.conf
	ln -s ~/Git/dotfiles/bash/.bash_aliases ~
	ln -s ~/Git/dotfiles/bash/.bashrc ~
	ln -s ~/Git/dotfiles/bash/.bash_profile ~
	ln -s ~/Git/dotfiles/git/.git-completion.bash ~
	ln -s ~/Git/dotfiles/git/.gitconfig ~
	ln -s ~/Git/dotfiles/tmux/.tmux.conf ~

link_mac:
	rm ~/.hushlogin
	ln -s ~/Git/dotfiles/macos/.hushlogin ~

brew:
	./macos/install_brew.sh
	sudo chsh -s /usr/local/bin/bash

cask:
	brew bundle --file ./macos/Caskfile

cask_personal:
	brew bundle --file ./macos/Caskfile.personal

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s ~/Git/dotfiles/tmux/themes ~/.tmux/themes

bash_git_prompt:
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	rm ~/.git-prompt-colors
	ln -s ~/Git/dotfiles/git/.git-prompt-colors.sh ~

vim:
	ln -s ~/Git/dotfiles/.vim ~
	ln -s ~/Git/dotfiles/.vimrc ~
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
