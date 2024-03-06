linux: link bash_git_prompt tmux vim zsh
macos: link link_mac mac_setup bash_git_prompt tmux vim zsh brew cask

link:
	-rm ~/.aliases
	-rm ~/.bash_profile
	-rm ~/.bashrc
	-rm ~/.git-completion.bash
	-rm ~/.gitconfig
	-rm ~/.tmux.conf
	-rm ~/.zsh/.zprompt
	-rm ~/.zsh/.zshrc
	-rm ~/.zshenv
	mkdir -p ~/.zsh
	ln -s ~/Git/dotfiles/git/.git-completion.bash ~
	ln -s ~/Git/dotfiles/git/.gitconfig ~
	ln -s ~/Git/dotfiles/shell/.aliases ~
	ln -s ~/Git/dotfiles/shell/.bashrc ~
	ln -s ~/Git/dotfiles/shell/.bash_profile ~
	ln -s ~/Git/dotfiles/shell/.zprompt ~/.zsh/
	ln -s ~/Git/dotfiles/shell/.zshrc ~/.zsh/
	ln -s ~/Git/dotfiles/shell/.zshenv ~
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
	-git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	-rm ~/.git-prompt-colors
	-ln -s ~/Git/dotfiles/git/.git-prompt-colors.sh ~

vim:
	-rm ~/.vim
	-rm ~/.vimrc
	ln -s ~/Git/dotfiles/.vim ~
	ln -s ~/Git/dotfiles/.vimrc ~
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

zsh:
	mkdir -p ~/.zsh/plugins
	-git clone git@github.com:arzzen/calc.plugin.zsh.git ~/.zsh/plugins/calc.plugin.zsh
	-git clone git@github.com:softmoth/zsh-vim-mode.git ~/.zsh/plugins/zsh-vim-mode
	-git clone https://github.com/lukechilds/zsh-better-npm-completion.git ~/.zsh/plugins/.zsh-better-npm-completion
	-git clone https://github.com/sunlei/zsh-ssh ~/.zsh/plugins/zsh-ssh
	mkdir -p ~/.zsh/plugins/bd
	curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > ~/.zsh/plugins/bd/bd.zsh
